//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "C:/Xilinx_2019/SDK/2019.1/bin;C:/Xilinx_2019/Vivado/2019.1/ids_lite/ISE/bin/nt64;C:/Xilinx_2019/Vivado/2019.1/ids_lite/ISE/lib/nt64;C:/Xilinx_2019/Vivado/2019.1/bin;";
} else {
  PathVal = "C:/Xilinx_2019/SDK/2019.1/bin;C:/Xilinx_2019/Vivado/2019.1/ids_lite/ISE/bin/nt64;C:/Xilinx_2019/Vivado/2019.1/ids_lite/ISE/lib/nt64;C:/Xilinx_2019/Vivado/2019.1/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "vivado",
         "-log design1_memory_reader_IP_0_1.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source design1_memory_reader_IP_0_1.tcl" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
