
# NUMERICAL METHODS

## STEREO_TO_MONO
    Functia implementeaza formula din enuntul temei.

## SPECTOGRAM
        Functia calculeaza spectrograma unui semnal dat folosind transformata
    Fourier (urmareste pasii din enuntul temei). Funcția ia un semnal de
    intrare și îl împarte în ferestre de lungime window_size. Fiecare
    fereastră este multiplicată cu o fereastră Hann pentru a reduce
    efectele de discontinuitate la marginile ferestrelor. Apoi, se aplică
    transformata Fourier pe fiecare fereastră, și se păstrează doar prima
    jumătate a rezultatului, deoarece transformata Fourier a unui semnal
    real este simetrică. Rezultatele sunt stocate într-o matrice S, care
	reprezintă spectrograma semnalului. Vectorii f și t reprezintă frecvențele
    și timpii corespunzători fiecărei coloane din matricea S.

## OSCILLATOR
        Aceasta functie este implementata pentru prelucrarea sunetelor, urmand
    pasii din enunt pentru a vedea cum variaza amplitudinea semnalului de-a
    lungul timpului. Functia creeaza unvector de timp (t) care reprezinta
    fiecare esantion de la 0 pana la durata specificata(dur) cu o rezolutie
    determiata de frecventa de esantionare(fs), un semnal sinusoidal
    (sin_wave), dupa care calculeaza toti parametrii pentru formatul ADSR
    (atack, decay, sustain, release). La final, dupa ce a concatenat toti
    vectorii coloana formati anterior intr-un vector coloana lung(envelope) se
    realizeaza modularea in amplitudine a semnalului sinusoidal de la inceput
    prin inmultirea punctuala cu envelope, rezultand semnalul final modulat.

## LOW_PASS
        Functia filtreaza semnalul de intrare, pastrand doar componentele
    frecventelor sub o anumita frecventa de taiere (cutoff_freq), reducand
    astfel zgomotul si componentele de frecventa inalta.
        Pasii pe care-i urmeaza sunt cei descrisi in enunt : se calculeaza
    transformata Fourier a semnalului, apoi vectorul frecventelor 'f'. Se
    creeaza apoi un vector masca care este un vector logic ce contin valori
    'true'  pentru frecventele mai mici decat 'cutoff_freq' si 'false' pentru
    frecventele mai mari. Filtrez semnalul Fourier cu ajutorul vectorului
    'mask', fac apoi transformata Fourier inversa pentru a obtine semnalul
    filtrat, dupa care il normalizez.

## APPLY_REVERB
        Aceasta functie realizeaza reverberatia unui semnal audio folosind
    raspunusl unui impuls, ceea ce poate simula efectul acustic al unei camere
    sau al unui spatiu acustic specific. Functia converteste semnalul in mono
    pentru a simplifica calculele, realizeaza convolutia in domeniul
    frecventei: folosesc Transformata Fourier Rapida(FFT) a semnalului
    (inmultit element cu element cu impulse_response), dupa care aplic
    transformata Fourier inversa (IFFT) pentru a reveni in domeniul timpului
    si a obtine rezultatul convolutiei. La final, rezultatul convolutiei este
    normalizat astfel incat valoriel sale sa fie in intervalul [-1, 1]: impart
    rezultatul convolutiei la valoarea absoluta maxima a acestuia.

## studio.m - intrebari

### q1 : 
	% Comment on the difference between 'Plain Sound' and the "Plain Loop" one.
	% Why does it look like that? 
	ANSWER : Diferenta dintre spectrogramele celor doua semnale, "Plain Loop"
	si "Plain Sound", poate fi observata in domeniul frecventelor si timpului.
	Spectrograma "Plain Sound" arata o mai mare varietate de frecvente si
	intensitati in timp, comparativ cu "Plain Loop", care arata o consistenta
	mai mare in spectru si intensitate.

### q2:
	% Comment on the difference between 'Low Pass Spectogram' and "Plain Sound".
	ANSWER : Diferenta dintre spectrogramele "Plain Sound" si "Low Pass Sound"
	poate fi observata in modul in care frecventele inalte sunt eliminate in
	"Low Pass Sound" prin aplicarea unui filtru low-pass. "Low Pass Sound"
	arata un spectru mai restrans al semnalului in comparatie cu "Plain Sound",
	unde frecventele inalte sunt eliminate, pastrand doar componentele de
	frecvente mai joase si medii.

### q3:
	% Comment on the difference between 'Reverb Sound'' and "Plain Sound".
		Diferenta dintre spectrogramele "Plain Sound" si "Reverb Sound" poate
	fi observata in modul in care adaugarea efectului de reverb modifica
	distributia energiei in spectru si in timp.
		Spectrograma "Plain Sound" prezinta o distributie a energiei in
	functie de timp si frecventa in conformitate cu semnalul original. Cu
	toate acestea, in spectrograma "Reverb Sound", sunt prezente adaugiri
	suplimentare de energie la frecvente si momente ulterioare in timp,
	care corespund efectului de reverb.

### q4:
		Spectrograma pentru semnalul "Tech" ar putea arata o distributie a
	energiei mai concentrata in anumite frecvente si momente in timp,
	comparativ cu semnalele muzicale obisnuite care arata o distributie mai
	echilibrata a energiei in spectru si timp.
		Semnalul "Tech" este probabil un semnal dintr-un context tehnologic
	sau electronic, cum ar fi sunetele produse de echipamente electronice sau
	procese de calcul. Astfel de semnale pot avea caracteristici spectrale si
	temporale distincte, care se reflecta in spectrograma lor.

### q5:
		Spectrograma "Low Pass Tech" arata o atenuare semnificativa a
	componentelor de frecvente ridicate, datorata aplicarii filtrului
	low-pass. Acest lucru este evident prin reducerea energiei la frecvente
	inalte si pastrarea predominanta a componentelor de frecvente mai joase
	si medii.

### q6:
		Spectrograma "Reverb Tech" reflecta modificarile aduse semnalului
	original "Tech" prin adaugarea efectului de reverb, evidentiind noile
	caracteristici spectrale si temporale generate de acest proces de procesare
	a sunetului.Efectul de reverb adauga reflectii multiple ale sunetului
	original, prelungind timpul de decadere a sunetului si creand o amprenta
	sonora mai spatioasa sau mai "impaienjenita". In spectrograma "Reverb Tech",
	putem observa ca energia este distribuita intr-un mod mai difuz in domeniul
	frecventelor si timpului, in comparatie cu semnalul "Tech" original.

### q7:
		Spectrograma "Low Pass + Reverb Tech" ilustreaza modul in care efectele
	de filtrare si de reverb pot fi combinate pentru a modifica si a imbogati
	semnalul original "Tech", evidentiind caracteristicile spectrale si
	temporale adaugate de aceste procese de procesare a sunetului.
		Efectul de filtrare low-pass aplicat anterior asupra semnalului "Tech"
	a redus componentele de frecvente ridicate, eliminand astfel frecventele
	inalte care depasesc pragul de taiere specificat de frecventa de 1000 Hz.
		In spectrograma rezultata pentru "Low Pass + Reverb Tech", putem
	observa atat componentele spectrale reduse, datorita filtrului low-pass,
	cat si aparitia reverberatiilor si reflectiilor adaugate de efectul de
	reverb.

### q8:
		Ca si in cazul de mai sus, spectrograma "Reverb + Low Pass Tech"
	ilustreaza modul in care efectele de filtrare si de reverb pot fi combinate
	pentru a modifica si a imbogati semnalul original "Tech", evidentiind
	caracteristicile spectrale si temporale adaugate de aceste procese de
	procesare a sunetului.
		In spectrograma "Reverb + Low Pass Tech", putem observa atat efectul
	de reverb, prin aparitia linii suplimentare si umbre, cat si efectul de
	filtrare low-passs, prin reducerea energiei in frecventele inalte. Aceasta
	combinatie poate crea un sunet mai uniform si mai imbogatit, cu o prezenta
	spatiala pronuntata, dar si cu o atenuare a inaltimii tonurilor si a
	detaliilor in spectru.
