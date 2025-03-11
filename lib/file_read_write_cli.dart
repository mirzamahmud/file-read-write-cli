import 'dart:io';

class CommandRunner{
  static void runCommand(List<String> args){
    // ====================== check if the user provided the correct number of arguments ===========================
    if(args.length != 2){
      print('Usage: dart run file_read_write_cli <input_file> <output_file>');
      exit(1);
    }

    // ====================== get input and output file path from the arguments ====================================
    final inputFile = args[0];
    final outputFile = args[1];

    try{
      // ============================================== read input file ============================================
      final input = File(inputFile);
      final lines = input.readAsLinesSync();

      // ================================= process each lines and convert to upper case ============================
      final processedLines = lines.map((line) => line.toUpperCase()).toList();

      // ================================= write the processed lines to the output file ============================
      final output = File(outputFile);
      output.writeAsStringSync(processedLines.join('\n'));

      print('File processed successfully. Output written to $outputFile');
    }catch(e){
      // ============================================== handle error ===============================================
      print('Error: $e');
    }
  }
}
