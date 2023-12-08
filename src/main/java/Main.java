import database.ProductDB;

import java.time.LocalDateTime;

public class Main {
    public static void main(String[] args) {
        ProductDB.addCourse("Latte art", 2000.0, "Khóa Latte Art đào tạo kỹ thuật tạo hình cà phê từ bọt sữa dành cho các barista muốn nâng cao tay nghề và phát triển bản thân.", "Lets/img.png", "Hồ Dương Quang Minh", LocalDateTime.now());
//        ProductDB.addCoffeeBag("Cà phê Robusta", 2000.0, "Cà phê Robusta được trồng ở các vùng cao nguyên, có độ ẩm cao, nhiệt độ thấp, đất phù sa, có nhiều khoáng chất, đặc biệt là đất có nhiều tro nên cà phê Robusta có hương vị đậm đà, đắng, đặc trưng.", "Lets/img_2.png", "Đà Lạt", LocalDateTime.now(), LocalDateTime.now());
        ProductDB.addCourse("Kiến thức cơ bản về cà phê", 2000.0, "Khóa học giúp bạn hiểu thêm về cà phê ,hành trình from farm to cup , và các kì thuật pha cà phê cơ bản", "Lets/img_1.png", "Hồ Dương Quang Minh", LocalDateTime.now());
        ProductDB.addCourse("Handdrew", 2000.0, "Khóa học này cho ta tiếp cận đến những kiểu pha cà phê thủ công. Tìm hiểu về các loại cà phê đặc sản ở các nước khác.", "Lets/handdrew.jpg", "Hồ Dương Quang Minh", LocalDateTime.now());
        ProductDB.close();
    }
}
