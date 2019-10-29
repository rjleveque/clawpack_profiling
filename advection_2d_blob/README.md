# advection 2d blob

Example based on clawpack/amrclaw/examples/advection_2d_square

Currently set up to run using 4 levels of adaptive mesh refinement (AMR).
You can increase the refinement factors from one level to the next to make
it run more slowly.

In `setrun.py`, adjust these lines:

    # max number of refinement levels:
    amrdata.amr_levels_max = 4

    # List of refinement ratios at each level (length at least amr_level_max-1)
    amrdata.refinement_ratios_x = [4,4,2]
    amrdata.refinement_ratios_y = [4,4,2]
    amrdata.refinement_ratios_t = [4,4,2]

It is currently set to refine by a factor of 4 (in each direction and in
time) when refining from level 1 to 2, and another factor of 4 from level 2
to 3, and then by an additional factor of 2 in going from level 3 to 4.

