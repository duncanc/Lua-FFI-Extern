return {
  basicTypes = {
    GLclampf = "float";
    GLboolean = "unsigned char";
    GLenum = "unsigned int";
  };
  typeAliases = {
    ClampedFloat32 = "GLclampf";
    Boolean = "GLboolean";
    SamplePatternSGIS = "GLenum";
  };
  magicNumbers = {
    MULTISAMPLE_SGIS = 0x809D;
    SAMPLE_ALPHA_TO_MASK_SGIS = 0x809E;
    SAMPLE_ALPHA_TO_ONE_SGIS = 0x809F;
    SAMPLE_MASK_SGIS = 0x80A0;
    ["1PASS_SGIS"] = 0x80A1;
    ["2PASS_0_SGIS"] = 0x80A2;
    ["2PASS_1_SGIS"] = 0x80A3;
    ["4PASS_0_SGIS"] = 0x80A4;
    ["4PASS_1_SGIS"] = 0x80A5;
    ["4PASS_2_SGIS"] = 0x80A6;
    ["4PASS_3_SGIS"] = 0x80A7;
    SAMPLE_BUFFERS_SGIS = 0x80A8;
    SAMPLES_SGIS = 0x80A9;
    SAMPLE_MASK_VALUE_SGIS = 0x80AA;
    SAMPLE_MASK_INVERT_SGIS = 0x80AB;
    SAMPLE_PATTERN_SGIS = 0x80AC;
  };
  funcs = {
    {'SampleMaskSGIS';
      'ClampedFloat32', 'value';
      'Boolean', 'invert'};
    {'SamplePatternSGIS';
      'SamplePatternSGIS', 'pattern'};
  };
}
