public class Hamming {

    String sequence1;
    String sequence2;

    Hamming(String sequence1, String sequence2) {
        this.sequence1 = sequence1;
        this.sequence2 = sequence2;
        if (sequence1.length() != sequence2.length()) {
            throw new IllegalArgumentException();
        }
    }

    int getHammingDistance() {
        int hammingDistance = 0;
        for (int i = 0; i < sequence1.length(); i++) {
            if (sequence1.charAt(i) != sequence2.charAt(i)) {
                hammingDistance++;
            }
        }
        return hammingDistance;
    }
}
