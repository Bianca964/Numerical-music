function signal = low_pass(signal, fs, cutoff_freq)
  % TODO

  % compute the Fourier Transform of the signal
  fourier_signal = fft(signal);

  % compute all possible frequencies of the signal
  n = length(signal);
  f = (0:n - 1) * (fs / n);

  % create a vector mask
  mask = f < cutoff_freq;

  % apply Hadamard product between the Fourier Transform of signal and mask
  filtered_fourier_signal = fourier_signal .* mask';

  % compute the inverse Fourier Transform to get the filtered signal
  filtered_signal = ifft(filtered_fourier_signal);

  % normalize the filtered signal
  signal = filtered_signal / max(abs(filtered_signal));

endfunction
