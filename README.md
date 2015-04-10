# hmh_usecases_application

Todo
- Show % complete for tests that have passed

Known bugs:
- Error parsing file on "Courses" worksheet, cell(68, B). The Test Case ID
  should be unique but there are currently two test cases with the same id 
- Not all test_steps are being added to the db

To begin using:
1. Start server (rails s)
2. Navigate browser to "localhost:3000/upload"
3. Upload spreadsheet

To reset db:
1. rake db:drop db:create db:migrate
