light environmentlight2
(
  float exposure = 0, samples = 64, maxvariation = 0.02, maxdist = 10;
  string envmap = "";
  color filter = color(1);
  output float __nonspecular = 1;)
{
  normal Nn = normalize(N);

  illuminate (Ps + Nn) { /* force execution independent of light location */

    /* Compute occlusion and average unoccluded dir (environment dir) */
    vector envdir = 0;
    float occ = occlusion(Ps, Nn, samples, "maxvariation", maxvariation,
                          "maxdist", maxdist, "environmentdir", envdir, 
                          "hitsides", "both");

    /* Lookup in pre-blurred environment map */
    color envcolor = environment(envmap, envdir);

    /* Set Cl */
    Cl = pow(2, exposure) * filter * (1 - occ) * envcolor;
  }
}