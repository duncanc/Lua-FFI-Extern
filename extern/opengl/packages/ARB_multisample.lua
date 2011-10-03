return {
  basicTypes = {
    GLclampf = "float";
    GLboolean = "unsigned char";
  };
  typeAliases = {
    ClampedFloat32 = "GLclampf";
    Boolean = "GLboolean";
  };
  magicNumbers = {
    MULTISAMPLE_ARB = 0x809D;
    SAMPLE_ALPHA_TO_COVERAGE_ARB = 0x809E;
    SAMPLE_ALPHA_TO_ONE_ARB = 0x809F;
    SAMPLE_COVERAGE_ARB = 0x80A0;
    SAMPLE_BUFFERS_ARB = 0x80A8;
    SAMPLES_ARB = 0x80A9;
    SAMPLE_COVERAGE_VALUE_ARB = 0x80AA;
    SAMPLE_COVERAGE_INVERT_ARB = 0x80AB;
    MULTISAMPLE_BIT_ARB = 0x20000000;
  };
  funcs = {
    {'SampleCoverageARB';
      'ClampedFloat32', 'value';
      'Boolean', 'invert'};
  };
}
