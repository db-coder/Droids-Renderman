surface
pointbasedglossyreflection (string filename = "", sides = "front";
                            float clampbleeding = 1, sortbleeding = 1,
                            maxdist = 1e15, falloff = 0, falloffmode = 0,
                            coneangle = 0.2,
                            samplebase = 0.0, bias = 0.01,
                            maxsolidangle = 0.01;)
{
  normal Nn = normalize(N);
  vector refl = reflect(I, Nn);
  color irr;

  irr = indirectdiffuse(P, refl, 0, "pointbased", 1, "filename", filename,
                        "hitsides", sides, "clamp", clampbleeding,
                        "sortbleeding", sortbleeding,
                        "maxdist", maxdist, "falloff", falloff,
                        "falloffmode", falloffmode,
                        "coneangle", coneangle,
                        "samplebase", samplebase, "bias", bias,
                        "maxsolidangle", maxsolidangle);

  Ci = Os * Cs * irr;
  Oi = Os;
}