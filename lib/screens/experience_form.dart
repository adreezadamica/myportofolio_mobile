import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _organization = "";
  String _type = "Organisasi";
  String _role = "";
  String _description = "";
  DateTime? _startDate;
  DateTime? _endDate;
  final _startCtrl = TextEditingController();
  final _endCtrl = TextEditingController();

  final List<String> _types = [
    'Organisasi',
    'Kepanitiaan',
    'Volunteer',
    'Asisten Lab/Dosen',
    'Magang',
    'Lainnya',
  ];

  @override
  void dispose() {
    _startCtrl.dispose();
    _endCtrl.dispose();
    super.dispose();
  }

  String _fmt(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _pickDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        _startDate = picked;
        _startCtrl.text = _fmt(picked);
      } else {
        _endDate = picked;
        _endCtrl.text = _fmt(picked);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Experience Form'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Organisasi
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Organisasi / Tempat Kegiatan",
                    hintText: "Contoh: BEM Fasilkom UI",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (v) => setState(() => _organization = v),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Organisasi tidak boleh kosong!";
                    if (v.trim().length > 100) return "Maksimal 100 karakter!";
                    return null;
                  },
                ),
              ),

              // Jenis kegiatan (dropdown)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Jenis Kegiatan",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  initialValue: _type,
                  items: _types
                      .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                      .toList(),
                  onChanged: (v) => setState(() => _type = v!),
                ),
              ),

              // Jabatan
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Jabatan",
                    hintText: "Contoh: Staf Divisi Teknologi",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (v) => setState(() => _role = v),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Jabatan tidak boleh kosong!";
                    if (v.trim().length > 100) return "Maksimal 100 karakter!";
                    return null;
                  },
                ),
              ),

              // Tanggal mulai
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Mulai",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onTap: () => _pickDate(isStart: true),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? "Tanggal mulai wajib dipilih!" : null,
                ),
              ),

              // Tanggal selesai
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Selesai",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onTap: () => _pickDate(isStart: false),
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Tanggal selesai wajib dipilih!";
                    if (_startDate != null && _endDate != null && _endDate!.isBefore(_startDate!)) {
                      return "Tanggal selesai tidak boleh sebelum tanggal mulai!";
                    }
                    return null;
                  },
                ),
              ),

              // Deskripsi tugas
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Deskripsi Tugas",
                    hintText: "Apa saja tanggung jawab dan kontribusimu?",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (v) => setState(() => _description = v),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Deskripsi tugas tidak boleh kosong!";
                    if (v.trim().length > 500) return "Maksimal 500 karakter!";
                    return null;
                  },
                ),
              ),
            ],           
          )
        ),
      ),
    );
  }
}