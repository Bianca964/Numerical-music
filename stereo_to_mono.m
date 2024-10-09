function mono = stereo_to_mono(stereo)
  % TO DO
  mono = stereo;
  [m, n] = size(mono);
  mono = mean(stereo, 2);

  % Normalize
  mono = mono / max(abs(mono));
endfunction

