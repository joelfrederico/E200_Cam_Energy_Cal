function E_axis = E200_cam_E_cal(data,y)
	% Calibration depends on good orbit through quads,
	% spectrometer magnet strength, and ...
	E0 = 20.35;
	
	B_spect = data.raw.scalars.LI20_LGPS_3330_BDES.dat{1};
	etay = 62e-3 * (B_spect/20.35) * (9.28/10.33);
	E_axis = -etay*E0./y;
end
