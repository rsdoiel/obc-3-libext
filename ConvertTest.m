MODULE ConvertTest;

IMPORT T := Tests, Convert := extConvert;

VAR ts : T.TestSet;

PROCEDURE TestIntConvs() : BOOLEAN;
  VAR test : BOOLEAN;
BEGIN test := TRUE;
  T.ExpectedBool(TRUE, FALSE, "TestIntConvs() not implemented.", test);
END TestIntConvs;

PROCEDURE TestRealConvs() : BOOLEAN;
  VAR test : BOOLEAN;
BEGIN test := TRUE;
  T.ExpectedBool(TRUE, FALSE, "TestRealConvs() not implemented.", test);
END TestRealConvs;

BEGIN
  T.Init(ts, "extConvert");
  T.Add(ts, TestIntConvs);
  T.Add(ts, TestRealConvs);
  ASSERT(T.Run(ts));
END ConvertTest.
