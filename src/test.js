/**
 * Underscore for Google Apps Script - Test suite
 */

QUnit.helpers(this);

function tests() {
  _ = Underscore.load();
  testArrays();
  testChaining();
  testCollections();
  testFunctions();
  testObjects();
  testUtility();
}

function doGet(e) {
  QUnit.urlParams(e.parameter);
  QUnit.config({
    title: "Underscore for Google Apps Script - Test suite"
  });
  QUnit.load(tests);
  return QUnit.getHtml();
};
