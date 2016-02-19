#include<stdrsl/IsotropicVolume.h>
#include<stdrsl/Fresnel.h>

// photonVolumeHomo:
// A plausible volume material with homogeneous extinction.
// Uses a simple isotropic scattering phase function.
class Volume (
  varying float density = 1;
  uniform color albedo = color(1,1,1);
  uniform string lightCategory = "";
  uniform float __computesOpacity = 1;
  )
{
  // Member variables
  stdrsl_ShadingContext m_shadingCtx;
  stdrsl_IsotropicVolume m_diffuse;
  stdrsl_Fresnel m_fresnel;

  public void opacity(output color Oi) {
    Oi = density * Os; // homogeneous extinction
  }

  public void diffuselighting(output color Ci, Oi) {
    color diffColor = albedo * Cs;
    m_diffuse->init(diffColor);

    Ci = directlighting(this, getlights("category",lightCategory),
                        "integrationdomain", "sphere");

    Oi = density * Os;
    Ci *= Oi;
  }

  public void evaluateSamples(string distribution;
                              output __radiancesample samples[])
  {
    if (distribution == "diffuse")
      m_diffuse->evalDiffuseSamps(m_shadingCtx, m_fresnel, samples);
  }
}