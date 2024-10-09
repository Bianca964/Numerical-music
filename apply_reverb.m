function signal = apply_reverb(signal, impulse_response)
  %  TO DO

  % ensure impulse response is in mono (step 1)
  impulse_response = stereo_to_mono(impulse_response);
  
  % implement fftconv (step 2)
  % calculate the FFT of both signal and impulse response
  N = length(signal) + length(impulse_response) - 1;
  fft_signal = fft(signal, N);
  fft_impulse_response = fft(impulse_response, N);
  
  % compute the convolution
  conv_result = ifft(fft_signal .* fft_impulse_response);

  % normalize the resulting signal (step 3)
  signal = conv_result / max(abs(conv_result));

endfunction
