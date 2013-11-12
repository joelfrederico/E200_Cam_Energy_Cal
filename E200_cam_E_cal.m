function E_axis = E200_cam_E_cal(data,y)
	% ====================================
	% Calibration depends on good orbit through quads,
	% spectrometer magnet strength, and ...?
	% ====================================

	% ====================================
	% Default energy and corresponding y location
	% ====================================
	E0 = 20.35;
	% y0 determined from ROI'd centroid of E200_11469
	% step 6, image 32.
	y0 = 476.5593;
	
	% ====================================
	% Get the magnet strength
	% ====================================
	B_spect = data.raw.scalars.LI20_LGPS_3330_BDES.dat{1};

	% ====================================
	% The dispersion at y0
	% ====================================
	etay = 62e-3 * (B_spect/20.35) * (9.28/10.33);

	% ====================================
	% Convert to energy axis
	% E_axis = -etay*E0./(y-y0);
	% E_axis = E0./( 1-((y-y0)/etay) );
	E_axis = E0*( 1- (y-y0)/etay );
	display(-etay*(0.01)+y0);
	display(-etay*(-0.01)+y0);
end
