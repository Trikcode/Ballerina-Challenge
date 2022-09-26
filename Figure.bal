import ballerina/io;

function processFuelRecords(string inputFilePath, string outputFilepath) returns error? {

    // read input file if lines in CSV : 2 <= n <= 1000
    string[] lines = check io:fileReadLines(inputFilePath);
    if lines.length() < 2 || lines.length() > 1000 {
        return error("Invalid number of lines in input file");
    }
    //Number of employees = 97  and read to output

    // create output file
    io:WritableCSVChannel csvChannel = check io:openWritableCsvFile(outputFilepath);
    check csvChannel.write(["employee_id", "gas_fill_up_count", "total_fuels_cost", "total_gallons", "total_miles_accrued"]);
    check csvChannel.close();

    // close output file
    check csvChannel.close();

}
