return {
  basicTypes = {
    GLenum = "unsigned int";
    GLdouble = "double";
    GLint = "int";
    GLint = "int";
    GLfloat = "float";
    GLbitfield = "unsigned int";
  };
  typeAliases = {
    FfdTargetSGIX = "GLenum";
    CoordD = "GLdouble";
    Int32 = "GLint";
    CheckedInt32 = "GLint";
    CoordF = "GLfloat";
    FfdMaskSGIX = "GLbitfield";
  };
  magicNumbers = {
    GEOMETRY_DEFORMATION_SGIX = 0x8194;
    TEXTURE_DEFORMATION_SGIX = 0x8195;
    DEFORMATIONS_MASK_SGIX = 0x8196;
    MAX_DEFORMATION_ORDER_SGIX = 0x8197;
  };
  funcs = {
    {'DeformationMap3dSGIX';
      'FfdTargetSGIX', 'target';
      'CoordD', 'u1';
      'CoordD', 'u2';
      'Int32', 'ustride';
      'CheckedInt32', 'uorder';
      'CoordD', 'v1';
      'CoordD', 'v2';
      'Int32', 'vstride';
      'CheckedInt32', 'vorder';
      'CoordD', 'w1';
      'CoordD', 'w2';
      'Int32', 'wstride';
      'CheckedInt32', 'worder';
      'const CoordD*', 'points'};
    {'DeformationMap3fSGIX';
      'FfdTargetSGIX', 'target';
      'CoordF', 'u1';
      'CoordF', 'u2';
      'Int32', 'ustride';
      'CheckedInt32', 'uorder';
      'CoordF', 'v1';
      'CoordF', 'v2';
      'Int32', 'vstride';
      'CheckedInt32', 'vorder';
      'CoordF', 'w1';
      'CoordF', 'w2';
      'Int32', 'wstride';
      'CheckedInt32', 'worder';
      'const CoordF*', 'points'};
    {'DeformSGIX';
      'FfdMaskSGIX', 'mask'};
    {'LoadIdentityDeformationMapSGIX';
      'FfdMaskSGIX', 'mask'};
  };
}
