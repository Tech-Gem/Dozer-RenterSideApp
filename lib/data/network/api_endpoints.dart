class ApiEndPoints {
  final String baseApi =
      'https://zybjozozskmd3d7is4aayizvma0htrjx.lambda-url.ap-south-1.on.aws/';

  final String login = 'api/v1/creds/login';
  final String locations = 'api/v1/user/my_locations_assessments';
  final String apiPwdResetLink = 'api/v1/password/generate_reset_link';
  final String getMyProfile = 'api/v1/user/my_profile';
  final String getSummary = 'api/v1/audit/';
  final String getAssessmentCategory = 'api/v1/assessment/category/';
  final String getAssessCatAudit = 'api/v1/audit/';
  final String getSectionStandard = 'api/v1/audit_section/';
  final String getAuditStandard = 'api/v1/audit_standard/';
  final String getAction = 'api/v1/action/';
  final String getActionForAccount = '/api/v1/action/for/account/';
  final String getActionForAudit = 'api/v1/action/audit/';
  final String getInitAction = 'api/v1/action/init';
  final String getComment = 'api/v1/comment/';
  final String getImageUrl = 'api/v1/image/';
  final String putStandardValue = 'api/v1/audit_standard/';
  final String checklistLocation = 'api/v1/checklist_audit/locations/';
  final String locationBasedChecklists = '/api/v1/checklist/locations/';
  final String baseChecklist = 'api/v1/checklist/';
  final String createChecklistAudit = '/api/v1/checklist_audit';
  final String sectionAudit = '/api/v1/checklist_audit/sections/';
}
