#= require jasmine-reporters/src/jasmine.junit_reporter.js
#
class jasmine.HeadlessReporter.JUnit extends jasmine.JUnitXmlReporter
  constructor: (@outputTarget = null) ->
    super(@outputTarget)

  writeFile: (filename, text) =>
    JHW.printFile(filename, text)

  reportSpecResults: (spec) =>
    JHW.ping()
    super(spec)

  reportRunnerResults: (runner) =>
    super(runner)

    JHW.finishSuite()

    if window.JHW
      window.onbeforeunload = null

