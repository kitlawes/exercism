import java.time.LocalDate;
import java.time.LocalDateTime;

public class Gigasecond {

    LocalDateTime time;

    Gigasecond(LocalDate time) {
        this.time = time.atTime(0,0);
    }

    Gigasecond(LocalDateTime time) {
        this.time = time;
    }

    LocalDateTime getDate() {
        return time.plusSeconds((long) Math.pow(10, 9));
    }
}
