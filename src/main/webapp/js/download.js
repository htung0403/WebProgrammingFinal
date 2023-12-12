document.getElementById('downloadButton').addEventListener('click', function() {
    // Thay đổi 'your_file.pdf' thành đường dẫn thực sự của file PDF bạn muốn tải về
    var pdfFilePath = "Lets/profile.pdf";

    // Tạo một đối tượng a (một liên kết)
    var link = document.createElement('a');

    // Thiết lập thuộc tính href cho liên kết
    link.href = pdfFilePath;

    // Đặt thuộc tính download để buộc trình duyệt tải về file thay vì hiển thị nó
    link.download = 'profile.pdf.pdf';

    // Thêm liên kết vào trang web
    document.body.appendChild(link);

    // Simulate a click on the link to trigger the download
    link.click();

    // Xóa liên kết sau khi đã sử dụng
    document.body.removeChild(link);
});