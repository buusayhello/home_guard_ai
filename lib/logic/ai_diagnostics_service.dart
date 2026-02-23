class AIDiagnosticsService {
  // Mock Knowledge Base - Sẽ được thay thế bằng SQLite/ObjectBox nén
  final Map<String, String> _errorKnowledgeBase = {
    'E1': 'Lỗi cảm biến nhiệt độ phòng. Kiểm tra giắc cắm hoặc thay cảm biến.',
    'E2': 'Lỗi cảm biến dàn lạnh. Kiểm tra gas hoặc cảm biến ống đồng.',
    'E10': 'Lỗi cấp nước. Kiểm tra nguồn nước hoặc van từ.',
    'F1': 'Lỗi giao tiếp giữa dàn nóng và dàn lạnh.',
    'P0': 'Lỗi bảo vệ quá dòng IPM.',
    'P1': 'Lỗi bảo vệ điện áp cao/thấp.',
    'P4': 'Lỗi nhiệt độ xả máy nén quá cao.',
    'H1': 'Đang rã băng (Defrosting) - Đây là trạng thái bình thường.',
    'LE': 'Lỗi rò rỉ nước (Máy giặt).',
    'OE': 'Lỗi thoát nước (Máy giặt).',
    'UE': 'Lỗi mất cân bằng lồng giặt.',
  };

  Future<String> diagnose(String errorCode, String brand) async {
    // Trong production, đây sẽ gọi On-device LLM để suy luận
    // Hiện tại dùng lookup nhanh để đảm bảo Offline-first
    final result = _errorKnowledgeBase[errorCode.toUpperCase()];
    if (result != null) {
      return 'Chẩn đoán [$brand]: $result';
    }
    return 'Chưa tìm thấy mã lỗi trong cơ sở dữ liệu nội bộ. Vui lòng kiểm tra lại model.';
  }
}
