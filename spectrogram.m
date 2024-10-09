function [S f t] = spectrogram(signal, fs, window_size)
	% S = 0;
  % f = 0;
  % t = 0;

  %  TO DO

  % get the size of the signal
  signal_length = length(signal);
  
  % compute the number of windows
  nr_windows = floor(signal_length / window_size);
  
  % initialize the spectrogram matrix
  S = zeros(window_size, nr_windows);
  
  % define the Hann window
  hann_window = hanning(window_size);
  
  % loop through each window
  for i = 1:nr_windows
    % get the start and the end of the current window
    start_idx = (i - 1) * window_size + 1;
    end_idx = i * window_size;
    
    % extract the current window from the signal
    current_window = signal(start_idx:end_idx);
    
    % apply the Hann window
    windowed_signal = current_window .* hann_window;
    
    % compute the Fourier Transform of the windowed signal
    fft_result = fft(windowed_signal, 2 * window_size);
    
    % discard the conjugate part and take only the first half
    fft_result = fft_result(1:window_size);
    
    % store the result in the spectrogram matrix
    S(:, i) = abs(fft_result);
  endfor
  
  % compute the frequency vector
  f = (0:window_size - 1)' .* (fs / (2 * window_size));
  
  % compute the time vector
  t = (0:nr_windows - 1)' .* (window_size / fs);

endfunction

