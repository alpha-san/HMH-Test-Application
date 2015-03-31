require 'roo'

class SpreadsheetImporter
  attr_reader :file, :use_cases, :test_cases, :test_steps, :test_executions, :test_results

  MIME_TYPES = {
      xlsx: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      xls: 'application/vnd.ms-excel',
      ods: 'application/vnd.oasis.opendocument.spreadsheet',
  }.invert


  def initialize(use_case, uploaded_file)
    @use_case = use_case
    @file = Roo::Spreadsheet.open(uploaded_file)

    @test_cases = {}
    @test_steps = {}
    @test_executions = {}
    @test_results = {}

    parse_spreadsheet
  end

  def parse_spreadsheet

    @file.each_with_pagename do |name, sheet|

      #puts sheet.row(i).inspect

      # create use case
      this_use_case = UseCase.new
      this_use_case.title = name

      # create test execution
      this_test_execution = TestExecution.new
      this_test_execution.date = sheet.cell(1,'C')

      i = 2
      while i < sheet.last_row do
      #2.upto sheet.last_row do |i|

        # create test case
        this_test_case = TestCase.new
        this_test_case.id_description = sheet.row(i)[1]
        i += 1
        this_test_case.title = sheet.row(i)[1]
        i += 2

        this_test_steps = Array.new
        this_test_results = {}

         until sheet.row(i)[1].nil?

           # create test steps
           this_test_step = TestStep.new
           this_test_step.title = sheet.row(i)[1]
           this_test_case.test_steps << this_test_step
           this_test_step.save

           this_test_steps << this_test_step

           # create test result
           this_test_result = TestResult.new
           this_test_result.status = sheet.row(i)[2][0,1] == "Y"

           if (sheet.row(i)[2].length > 1)
             this_test_result.comment = sheet.row(i)[2]
           end

           this_test_result.test_step_id = this_test_step.id
           this_test_result.save

           this_test_execution.test_results << this_test_result

           this_test_step.test_result_id = this_test_result.id
           this_test_step.save

           this_test_results[this_test_step.title] = this_test_result

           i += 1

         end # end test steps and test results

        i += 1
        this_test_case.save
        puts "ending for now"

      end # end test case

      this_use_case.test_cases << this_test_case
      puts "ending test cases"

    end # end sheet

  end

end
