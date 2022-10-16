
//BİR CLASSTAN BAŞKA BİR CLASSI COPY ETTİK İMPLEMENTS İLE 
class fileDownloadException implements Exception {
  @override
  String toString() {
    return 'File Download has failed';
  }
}