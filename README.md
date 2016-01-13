# MScan Lab
Essential matlab functions for analyzing .MDF created by **MScan** (Inc. SutterInstruments).

## Dependency
**Windows, Matlab(>2010b)**
Inaddition to above, you have to install [Mview](http://www.sutter.com/SOFTWARE/microscope_frame.html).
All codes are tested with Matlab2015a & MView(3.0.0.2)

## Functions
### Utility
  - makeMCSXObj.m: make COM-object
  - mdfSummary.m: load Summary data from MDF-file

### Data-loading
  - mcsxInfo.m: read properties of MDF-file
  - mcsxAnalog.m: read analog signal data from MDF-file
  - mcsxReadFrame.m: read frame(MxN) from MDF-file
  - mcsxReadFrames.m: read Frames(MxNxt) from MDF-file

## Contribution
Really Welcome to send me  a patch by email or pull request.

## License
 - GPL v3

 ----
 Ryosuke F Takeuchi & K Hakumoto 2016
