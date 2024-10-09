function x = oscillator(freq, fs, dur, A, D, S, R)
  % TO DO

  % create the time vector
  t = (0:1 / fs:dur - 1 / fs)';

  % apply function from the homework's statement
  sine_wave = sin(2 * pi * freq * t);

  % get the total number of samples
  total_samples = numel(t);

  % compute the envelope parameters
  attack_samples = floor(A * fs);
  decay_samples = floor(D * fs);
  release_samples = floor(R * fs);
  sustain_samples = total_samples - (attack_samples + decay_samples + 
                    release_samples);

  attack_env = (linspace(0, 1, attack_samples)');
  decay_env = (linspace(1, S, decay_samples))';
  sustain_env = S * ones(sustain_samples, 1);
  release_env = (linspace(S, 0, release_samples))';

  % concatenate envelopes
  envelope = [attack_env; decay_env; sustain_env; release_env];

  % apply the amplitude modulation (Hadamard product)
  x = sine_wave .* envelope;

endfunction
