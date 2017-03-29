public class RnaTranscription {
    public String ofDna(String dnaString) {
        for (int i = 0; i < dnaString.length(); i++) {
            switch (dnaString.charAt(i)) {
                case 'C':
                    dnaString = dnaString.substring(0, i) + 'G' + dnaString.substring(i + 1);
                    break;
                case 'G':
                    dnaString = dnaString.substring(0, i) + 'C' + dnaString.substring(i + 1);
                    break;
                case 'T':
                    dnaString = dnaString.substring(0, i) + 'A' + dnaString.substring(i + 1);
                    break;
                case 'A':
                    dnaString = dnaString.substring(0, i) + 'U' + dnaString.substring(i + 1);
                    break;
            }
        }
        return dnaString;
    }
}