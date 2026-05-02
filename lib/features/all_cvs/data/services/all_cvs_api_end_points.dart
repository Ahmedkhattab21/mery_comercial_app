import 'package:mery_comercial_app/core/api/end_points.dart';

class AllCvsApiEndPoints {
  static getNationalityCvsUrl(
    String code,
    bool? isMuslim,
    bool? isExperience,
  ) =>
      '${EndPoints.baseUrl}public/api/v1/enduser/cvs?nationality_code=$code${isMuslim == null ? '' : "&is_muslim=$isMuslim"}${isExperience == null ? '' : "&has_experience=$isExperience"}';

  static getOfficeCvsUrl(int officeId, {bool? isMuslim, bool? isExperience}) =>
      '${EndPoints.baseUrl}public/api/v1/enduser/cvs?office_id=$officeId&per_page=50${isMuslim == null ? '' : "&is_muslim=$isMuslim"}${isExperience == null ? '' : "&has_experience=$isExperience"}';
}
