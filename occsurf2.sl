surface occsurf2
(
  float samples = 64, maxvariation = 0.02, maxdist = 2.0;
  output varying color aov_occ = color(1, 0, 0);
)
{
  normal Nn = normalize(N); // normalize N

  // Compute occlusion
  float occ = occlusion(P, Nn, samples, "maxvariation", maxvariation,
                    "maxdist", maxdist);
  aov_occ = occ;

  // Set Ci and Oi
  Ci = (1 - occ) * Cs * Os;
  Oi = Os;
}