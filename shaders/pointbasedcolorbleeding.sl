#include "normals.h"

surface pointbasedcolorbleeding
(
  string filename = "", sides = "both", 
  coordsys = "world", bkmfile = "";
  float clampbleeding = 1, sortbleeding = 1,
  maxdist = 1000, falloff = 0, falloffmode = 0,
  samplebase = 0, bias = 0,
  maxsolidangle = 0.05, maxvariation = 0, 
  intensity = 1.0, reuse = 0.0, 
  filterscale = 1.0, lerp = 0.0, blend = 0.0;
  output varying color __colorbleed = color(0);
  output varying color __occlusion = color(0);
)
{
  normal Nn = normalize(N);
  color irr = 0;
  float occ = 0;
  color tex3d = 0;

  /*
  if(reuse == 1)
  {
    texture3d(filename, P, Nn, "coordsystem", coordsys,
            "_radiosity", irr, "filterscale", filterscale,
            "lerp", lerp);
  }
  else
  {
  */
  irr = intensity * indirectdiffuse(P, Nn, 0, "pointbased", 1, "filename", filename,
                        "hitsides", sides,
                        "clamp", clampbleeding,
                        "sortbleeding", sortbleeding,
                        "maxdist", maxdist, "falloff", falloff,
                        "falloffmode", falloffmode,
                        "samplebase", samplebase, "bias", bias,
                        "maxsolidangle", maxsolidangle,
                        "maxvariation", maxvariation,
                        "occlusion", occ);
  //}
  if (blend > 0)
  {
    texture3d(bkmfile, P, Nn, "coordsystem", coordsys,
            "_radiosity", tex3d, "filterscale", filterscale,
            "lerp", lerp);
    Ci = Os * Cs * mix(irr, tex3d, occ);
  }
  else
  {
    Ci = Os * Cs * irr;
  }
  Oi = Os;
  
  __colorbleed = irr;
  __occlusion = color(occ);
}