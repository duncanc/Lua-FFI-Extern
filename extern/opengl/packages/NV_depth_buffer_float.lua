return {
  basicTypes = {
    GLdouble = "double";
  };
  typeAliases = {
    Float64 = "GLdouble";
  };
  magicNumbers = {
    DEPTH_COMPONENT32F_NV = 0x8DAB;
    DEPTH32F_STENCIL8_NV = 0x8DAC;
    FLOAT_32_UNSIGNED_INT_24_8_REV_NV = 0x8DAD;
    DEPTH_BUFFER_FLOAT_MODE_NV = 0x8DAF;
  };
  funcs = {
    {'DepthRangedNV';
      'Float64', 'zNear';
      'Float64', 'zFar'};
    {'ClearDepthdNV';
      'Float64', 'depth'};
    {'DepthBoundsdNV';
      'Float64', 'zmin';
      'Float64', 'zmax'};
  };
}
