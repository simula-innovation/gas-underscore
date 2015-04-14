module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    gaslib: 'lib/gas-underscore-v<%= pkg.version %>'
    gastestlib: 'lib/gas-underscore-test-v<%= pkg.version %>'

    concat:
      underscore_tests:
        src: [
          'temp/arrays.js'
          'temp/chaining.js'
          'temp/collections.js'
          'temp/functions.js'
          'temp/objects.js'
          'temp/utility.js'
        ]
        dest: '<%= gastestlib %>/tests.gs.js'

    copy:
      sources:
        files: [
          {
            src: 'vendor/underscore/underscore.js'
            dest: '<%= gaslib %>/underscore.gs.js'
          }
          {
            src: 'src/main.js'
            dest: '<%= gaslib %>/main.gs.js'
          }
          {
            src: 'src/test.js'
            dest: '<%= gastestlib %>/test.gs.js'
          }
        ]

    shell:
      init:
        command: 'git submodule update --init'
        options:
          stdout: true
          stderr: true
          failOnError: true
      npm_update:
        command: 'npm update'
        options:
          stdout: true
          stderr: true
          failOnError: true
      pull_underscore:
        command: [
          'git checkout master'
          'git pull origin master'
        ].join('&&')
        options:
          execOptions:
            cwd: 'vendor/underscore'
          stdout: true
          stderr: true
          failOnError: true
      recursive_pull:
        command: 'git pull --recurse-submodules'
        options:
          stdout: true
          stderr: true
          failOnError: true

    'string-replace':
      tests:
        files: [
          'temp/arrays.js': 'vendor/underscore/test/arrays.js'
          'temp/chaining.js': 'vendor/underscore/test/chaining.js'
          'temp/collections.js': 'vendor/underscore/test/collections.js'
          'temp/functions.js': 'vendor/underscore/test/functions.js'
          'temp/objects.js': 'vendor/underscore/test/objects.js'
          'temp/utility.js': 'vendor/underscore/test/utility.js'
        ]
        options:
          replacements: [
            # Wraps tests in global functions so that they can be run in Google Apps Script
            pattern: /\(function\(\) \{([^]+)module\((\'|\")(\w+)([^\"\']*)(?:\'|\")([^]+)\}\(\)\);\n*$/mg
            replacement: 'function test$3() {$1module($2$3$4$2$5};\n'
          ,
            pattern: /(var _ = typeof[^;]+;)/
            replacement: '//$1'
          , # Ignore tests that break because of peculiarities with Google Apps Script
            pattern: /([ ]+)(bound = _\.bind\(func, null.*\);)\s+(var.*;)\s+(\/\/.*)\s+(ok.*;)/m
            replacement: '$1// Commented because of https://code.google.com/p/google-apps-script-issues/issues/detail?id=1718\n$1//$2\n$1//$3\n$1$4\n$1//$5'
          , # Ignore asynchronous tests (due to the lack of setTimeout in Google Apps Script)
            pattern: /([ ]+asyncTest\([^]+;)(?=\s+test\(\'once\')/m
            replacement: '/*\n$1\n*/'
          ,
            pattern: /(QUnit.config.async[^;]+;)/
            replacement: '//$1'
          ]

  grunt.registerTask 'build', [
    'shell:init'
    'copy'
    'string-replace'
    'concat'
  ]

  grunt.registerTask 'update', [
    'shell:npm_update'
    'shell:pull_underscore'
    'shell:recursive_pull'
  ]

  grunt.registerTask 'default', [
    'build'
  ]

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-string-replace'
