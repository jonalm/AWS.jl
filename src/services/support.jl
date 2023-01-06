# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: support
using AWS.Compat
using AWS.UUIDs

"""
    add_attachments_to_set(attachments)
    add_attachments_to_set(attachments, params::Dict{String,<:Any})

Adds one or more attachments to an attachment set.  An attachment set is a temporary
container for attachments that you add to a case or case communication. The set is
available for 1 hour after it's created. The expiryTime returned in the response is when
the set expires.     You must have a Business, Enterprise On-Ramp, or Enterprise Support
plan to use the Amazon Web Services Support API.    If you call the Amazon Web Services
Support API from an account that doesn't have a Business, Enterprise On-Ramp, or Enterprise
Support plan, the SubscriptionRequiredException error message appears. For information
about changing your support plan, see Amazon Web Services Support.

# Arguments
- `attachments`: One or more attachments to add to the set. You can add up to three
  attachments per set. The size limit is 5 MB per attachment. In the Attachment object, use
  the data parameter to specify the contents of the attachment file. In the previous request
  syntax, the value for data appear as blob, which is represented as a base64-encoded string.
  The value for fileName is the name of the attachment, such as troubleshoot-screenshot.png.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"attachmentSetId"`: The ID of the attachment set. If an attachmentSetId is not
  specified, a new attachment set is created, and the ID of the set is returned in the
  response. If an attachmentSetId is specified, the attachments are added to the specified
  set, if it exists.
"""
function add_attachments_to_set(
    attachments; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "AddAttachmentsToSet",
        Dict{String,Any}("attachments" => attachments);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function add_attachments_to_set(
    attachments,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return support(
        "AddAttachmentsToSet",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("attachments" => attachments), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    add_communication_to_case(communication_body)
    add_communication_to_case(communication_body, params::Dict{String,<:Any})

Adds additional customer communication to an Amazon Web Services Support case. Use the
caseId parameter to identify the case to which to add communication. You can list a set of
email addresses to copy on the communication by using the ccEmailAddresses parameter. The
communicationBody value contains the text of the communication.    You must have a
Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web Services
Support API.    If you call the Amazon Web Services Support API from an account that
doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
SubscriptionRequiredException error message appears. For information about changing your
support plan, see Amazon Web Services Support.

# Arguments
- `communication_body`: The body of an email communication to add to the support case.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"attachmentSetId"`: The ID of a set of one or more attachments for the communication to
  add to the case. Create the set by calling AddAttachmentsToSet
- `"caseId"`: The support case ID requested or returned in the call. The case ID is an
  alphanumeric string formatted as shown in this example:
  case-12345678910-2013-c4c1d2bf33c5cf47
- `"ccEmailAddresses"`: The email addresses in the CC line of an email to be added to the
  support case.
"""
function add_communication_to_case(
    communicationBody; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "AddCommunicationToCase",
        Dict{String,Any}("communicationBody" => communicationBody);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function add_communication_to_case(
    communicationBody,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return support(
        "AddCommunicationToCase",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("communicationBody" => communicationBody), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_case(communication_body, subject)
    create_case(communication_body, subject, params::Dict{String,<:Any})

Creates a case in the Amazon Web Services Support Center. This operation is similar to how
you create a case in the Amazon Web Services Support Center Create Case page. The Amazon
Web Services Support API doesn't support requesting service limit increases. You can submit
a service limit increase in the following ways:    Submit a request from the Amazon Web
Services Support Center Create Case page.   Use the Service Quotas
RequestServiceQuotaIncrease operation.   A successful CreateCase request returns an Amazon
Web Services Support case number. You can use the DescribeCases operation and specify the
case number to get existing Amazon Web Services Support cases. After you create a case, use
the AddCommunicationToCase operation to add additional communication or attachments to an
existing case. The caseId is separate from the displayId that appears in the Amazon Web
Services Support Center. Use the DescribeCases operation to get the displayId.    You must
have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web
Services Support API.    If you call the Amazon Web Services Support API from an account
that doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
SubscriptionRequiredException error message appears. For information about changing your
support plan, see Amazon Web Services Support.

# Arguments
- `communication_body`: The communication body text that describes the issue. This text
  appears in the Description field on the Amazon Web Services Support Center Create Case page.
- `subject`: The title of the support case. The title appears in the Subject field on the
  Amazon Web Services Support Center Create Case page.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"attachmentSetId"`: The ID of a set of one or more attachments for the case. Create the
  set by using the AddAttachmentsToSet operation.
- `"categoryCode"`: The category of problem for the support case. You also use the
  DescribeServices operation to get the category code for a service. Each Amazon Web Services
  service defines its own set of category codes.
- `"ccEmailAddresses"`: A list of email addresses that Amazon Web Services Support copies
  on case correspondence. Amazon Web Services Support identifies the account that creates the
  case when you specify your Amazon Web Services credentials in an HTTP POST method or use
  the Amazon Web Services SDKs.
- `"issueType"`: The type of issue for the case. You can specify customer-service or
  technical. If you don't specify a value, the default is technical.
- `"language"`: The language in which Amazon Web Services Support handles the case. Amazon
  Web Services Support currently supports English (\"en\") and Japanese (\"ja\"). You must
  specify the ISO 639-1 code for the language parameter if you want support in that language.
- `"serviceCode"`: The code for the Amazon Web Services service. You can use the
  DescribeServices operation to get the possible serviceCode values.
- `"severityCode"`: A value that indicates the urgency of the case. This value determines
  the response time according to your service level agreement with Amazon Web Services
  Support. You can use the DescribeSeverityLevels operation to get the possible values for
  severityCode.  For more information, see SeverityLevel and Choosing a Severity in the
  Amazon Web Services Support User Guide.  The availability of severity levels depends on the
  support plan for the Amazon Web Services account.
"""
function create_case(
    communicationBody, subject; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "CreateCase",
        Dict{String,Any}("communicationBody" => communicationBody, "subject" => subject);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_case(
    communicationBody,
    subject,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return support(
        "CreateCase",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "communicationBody" => communicationBody, "subject" => subject
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_attachment(attachment_id)
    describe_attachment(attachment_id, params::Dict{String,<:Any})

Returns the attachment that has the specified ID. Attachments can include screenshots,
error logs, or other files that describe your issue. Attachment IDs are generated by the
case management system when you add an attachment to a case or case communication.
Attachment IDs are returned in the AttachmentDetails objects that are returned by the
DescribeCommunications operation.    You must have a Business, Enterprise On-Ramp, or
Enterprise Support plan to use the Amazon Web Services Support API.    If you call the
Amazon Web Services Support API from an account that doesn't have a Business, Enterprise
On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error message
appears. For information about changing your support plan, see Amazon Web Services Support.


# Arguments
- `attachment_id`: The ID of the attachment to return. Attachment IDs are returned by the
  DescribeCommunications operation.

"""
function describe_attachment(
    attachmentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeAttachment",
        Dict{String,Any}("attachmentId" => attachmentId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_attachment(
    attachmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return support(
        "DescribeAttachment",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("attachmentId" => attachmentId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_cases()
    describe_cases(params::Dict{String,<:Any})

Returns a list of cases that you specify by passing one or more case IDs. You can use the
afterTime and beforeTime parameters to filter the cases by date. You can set values for the
includeResolvedCases and includeCommunications parameters to specify how much information
to return. The response returns the following in JSON format:   One or more CaseDetails
data types.   One or more nextToken values, which specify where to paginate the returned
records represented by the CaseDetails objects.   Case data is available for 12 months
after creation. If a case was created more than 12 months ago, a request might return an
error.    You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use
the Amazon Web Services Support API.    If you call the Amazon Web Services Support API
from an account that doesn't have a Business, Enterprise On-Ramp, or Enterprise Support
plan, the SubscriptionRequiredException error message appears. For information about
changing your support plan, see Amazon Web Services Support.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"afterTime"`: The start date for a filtered date search on support case communications.
  Case communications are available for 12 months after creation.
- `"beforeTime"`: The end date for a filtered date search on support case communications.
  Case communications are available for 12 months after creation.
- `"caseIdList"`: A list of ID numbers of the support cases you want returned. The maximum
  number of cases is 100.
- `"displayId"`: The ID displayed for a case in the Amazon Web Services Support Center user
  interface.
- `"includeCommunications"`: Specifies whether to include communications in the
  DescribeCases response. By default, communications are included.
- `"includeResolvedCases"`: Specifies whether to include resolved support cases in the
  DescribeCases response. By default, resolved cases aren't included.
- `"language"`: The language in which Amazon Web Services Support handles the case. Amazon
  Web Services Support currently supports English (\"en\") and Japanese (\"ja\"). You must
  specify the ISO 639-1 code for the language parameter if you want support in that language.
- `"maxResults"`: The maximum number of results to return before paginating.
- `"nextToken"`: A resumption point for pagination.
"""
function describe_cases(; aws_config::AbstractAWSConfig=global_aws_config())
    return support("DescribeCases"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
function describe_cases(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeCases", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    describe_communications(case_id)
    describe_communications(case_id, params::Dict{String,<:Any})

Returns communications and attachments for one or more support cases. Use the afterTime and
beforeTime parameters to filter by date. You can use the caseId parameter to restrict the
results to a specific case. Case data is available for 12 months after creation. If a case
was created more than 12 months ago, a request for data might cause an error. You can use
the maxResults and nextToken parameters to control the pagination of the results. Set
maxResults to the number of cases that you want to display on each page, and use nextToken
to specify the resumption of pagination.    You must have a Business, Enterprise On-Ramp,
or Enterprise Support plan to use the Amazon Web Services Support API.    If you call the
Amazon Web Services Support API from an account that doesn't have a Business, Enterprise
On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error message
appears. For information about changing your support plan, see Amazon Web Services Support.


# Arguments
- `case_id`: The support case ID requested or returned in the call. The case ID is an
  alphanumeric string formatted as shown in this example:
  case-12345678910-2013-c4c1d2bf33c5cf47

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"afterTime"`: The start date for a filtered date search on support case communications.
  Case communications are available for 12 months after creation.
- `"beforeTime"`: The end date for a filtered date search on support case communications.
  Case communications are available for 12 months after creation.
- `"maxResults"`: The maximum number of results to return before paginating.
- `"nextToken"`: A resumption point for pagination.
"""
function describe_communications(caseId; aws_config::AbstractAWSConfig=global_aws_config())
    return support(
        "DescribeCommunications",
        Dict{String,Any}("caseId" => caseId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_communications(
    caseId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeCommunications",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("caseId" => caseId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_services()
    describe_services(params::Dict{String,<:Any})

Returns the current list of Amazon Web Services services and a list of service categories
for each service. You then use service names and categories in your CreateCase requests.
Each Amazon Web Services service has its own set of categories. The service codes and
category codes correspond to the values that appear in the Service and Category lists on
the Amazon Web Services Support Center Create Case page. The values in those fields don't
necessarily match the service codes and categories returned by the DescribeServices
operation. Always use the service codes and categories that the DescribeServices operation
returns, so that you have the most recent set of service and category codes.    You must
have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web
Services Support API.    If you call the Amazon Web Services Support API from an account
that doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
SubscriptionRequiredException error message appears. For information about changing your
support plan, see Amazon Web Services Support.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"language"`: The language in which Amazon Web Services Support handles the case. Amazon
  Web Services Support currently supports English (\"en\") and Japanese (\"ja\"). You must
  specify the ISO 639-1 code for the language parameter if you want support in that language.
- `"serviceCodeList"`: A JSON-formatted list of service codes available for Amazon Web
  Services services.
"""
function describe_services(; aws_config::AbstractAWSConfig=global_aws_config())
    return support(
        "DescribeServices"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function describe_services(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeServices", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    describe_severity_levels()
    describe_severity_levels(params::Dict{String,<:Any})

Returns the list of severity levels that you can assign to a support case. The severity
level for a case is also a field in the CaseDetails data type that you include for a
CreateCase request.    You must have a Business, Enterprise On-Ramp, or Enterprise Support
plan to use the Amazon Web Services Support API.    If you call the Amazon Web Services
Support API from an account that doesn't have a Business, Enterprise On-Ramp, or Enterprise
Support plan, the SubscriptionRequiredException error message appears. For information
about changing your support plan, see Amazon Web Services Support.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"language"`: The language in which Amazon Web Services Support handles the case. Amazon
  Web Services Support currently supports English (\"en\") and Japanese (\"ja\"). You must
  specify the ISO 639-1 code for the language parameter if you want support in that language.
"""
function describe_severity_levels(; aws_config::AbstractAWSConfig=global_aws_config())
    return support(
        "DescribeSeverityLevels"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function describe_severity_levels(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeSeverityLevels",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_trusted_advisor_check_refresh_statuses(check_ids)
    describe_trusted_advisor_check_refresh_statuses(check_ids, params::Dict{String,<:Any})

Returns the refresh status of the Trusted Advisor checks that have the specified check IDs.
You can get the check IDs by calling the DescribeTrustedAdvisorChecks operation. Some
checks are refreshed automatically, and you can't return their refresh statuses by using
the DescribeTrustedAdvisorCheckRefreshStatuses operation. If you call this operation for
these checks, you might see an InvalidParameterValue error.    You must have a Business,
Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web Services Support API.
  If you call the Amazon Web Services Support API from an account that doesn't have a
Business, Enterprise On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException
error message appears. For information about changing your support plan, see Amazon Web
Services Support.    To call the Trusted Advisor operations in the Amazon Web Services
Support API, you must use the US East (N. Virginia) endpoint. Currently, the US West
(Oregon) and Europe (Ireland) endpoints don't support the Trusted Advisor operations. For
more information, see About the Amazon Web Services Support API in the Amazon Web Services
Support User Guide.

# Arguments
- `check_ids`: The IDs of the Trusted Advisor checks to get the status.  If you specify the
  check ID of a check that is automatically refreshed, you might see an InvalidParameterValue
  error.

"""
function describe_trusted_advisor_check_refresh_statuses(
    checkIds; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeTrustedAdvisorCheckRefreshStatuses",
        Dict{String,Any}("checkIds" => checkIds);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_trusted_advisor_check_refresh_statuses(
    checkIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return support(
        "DescribeTrustedAdvisorCheckRefreshStatuses",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("checkIds" => checkIds), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_trusted_advisor_check_result(check_id)
    describe_trusted_advisor_check_result(check_id, params::Dict{String,<:Any})

Returns the results of the Trusted Advisor check that has the specified check ID. You can
get the check IDs by calling the DescribeTrustedAdvisorChecks operation. The response
contains a TrustedAdvisorCheckResult object, which contains these three objects:
TrustedAdvisorCategorySpecificSummary     TrustedAdvisorResourceDetail
TrustedAdvisorResourcesSummary    In addition, the response contains these fields:
status - The alert status of the check can be ok (green), warning (yellow), error (red), or
not_available.    timestamp - The time of the last refresh of the check.    checkId - The
unique identifier for the check.      You must have a Business, Enterprise On-Ramp, or
Enterprise Support plan to use the Amazon Web Services Support API.    If you call the
Amazon Web Services Support API from an account that doesn't have a Business, Enterprise
On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error message
appears. For information about changing your support plan, see Amazon Web Services Support.
   To call the Trusted Advisor operations in the Amazon Web Services Support API, you must
use the US East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe
(Ireland) endpoints don't support the Trusted Advisor operations. For more information, see
About the Amazon Web Services Support API in the Amazon Web Services Support User Guide.

# Arguments
- `check_id`: The unique identifier for the Trusted Advisor check.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"language"`: The ISO 639-1 code for the language that you want your check results to
  appear in. The Amazon Web Services Support API currently supports the following languages
  for Trusted Advisor:   Chinese, Simplified - zh    Chinese, Traditional - zh_TW    English
  - en    French - fr    German - de    Indonesian - id    Italian - it    Japanese - ja
  Korean - ko    Portuguese, Brazilian - pt_BR    Spanish - es
"""
function describe_trusted_advisor_check_result(
    checkId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeTrustedAdvisorCheckResult",
        Dict{String,Any}("checkId" => checkId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_trusted_advisor_check_result(
    checkId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeTrustedAdvisorCheckResult",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("checkId" => checkId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_trusted_advisor_check_summaries(check_ids)
    describe_trusted_advisor_check_summaries(check_ids, params::Dict{String,<:Any})

Returns the results for the Trusted Advisor check summaries for the check IDs that you
specified. You can get the check IDs by calling the DescribeTrustedAdvisorChecks operation.
The response contains an array of TrustedAdvisorCheckSummary objects.    You must have a
Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web Services
Support API.    If you call the Amazon Web Services Support API from an account that
doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
SubscriptionRequiredException error message appears. For information about changing your
support plan, see Amazon Web Services Support.    To call the Trusted Advisor operations in
the Amazon Web Services Support API, you must use the US East (N. Virginia) endpoint.
Currently, the US West (Oregon) and Europe (Ireland) endpoints don't support the Trusted
Advisor operations. For more information, see About the Amazon Web Services Support API in
the Amazon Web Services Support User Guide.

# Arguments
- `check_ids`: The IDs of the Trusted Advisor checks.

"""
function describe_trusted_advisor_check_summaries(
    checkIds; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeTrustedAdvisorCheckSummaries",
        Dict{String,Any}("checkIds" => checkIds);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_trusted_advisor_check_summaries(
    checkIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return support(
        "DescribeTrustedAdvisorCheckSummaries",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("checkIds" => checkIds), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_trusted_advisor_checks(language)
    describe_trusted_advisor_checks(language, params::Dict{String,<:Any})

Returns information about all available Trusted Advisor checks, including the name, ID,
category, description, and metadata. You must specify a language code. The response
contains a TrustedAdvisorCheckDescription object for each check. You must set the Amazon
Web Services Region to us-east-1.    You must have a Business, Enterprise On-Ramp, or
Enterprise Support plan to use the Amazon Web Services Support API.    If you call the
Amazon Web Services Support API from an account that doesn't have a Business, Enterprise
On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error message
appears. For information about changing your support plan, see Amazon Web Services Support.
  The names and descriptions for Trusted Advisor checks are subject to change. We recommend
that you specify the check ID in your code to uniquely identify a check.    To call the
Trusted Advisor operations in the Amazon Web Services Support API, you must use the US East
(N. Virginia) endpoint. Currently, the US West (Oregon) and Europe (Ireland) endpoints
don't support the Trusted Advisor operations. For more information, see About the Amazon
Web Services Support API in the Amazon Web Services Support User Guide.

# Arguments
- `language`: The ISO 639-1 code for the language that you want your checks to appear in.
  The Amazon Web Services Support API currently supports the following languages for Trusted
  Advisor:   Chinese, Simplified - zh    Chinese, Traditional - zh_TW    English - en
  French - fr    German - de    Indonesian - id    Italian - it    Japanese - ja    Korean -
  ko    Portuguese, Brazilian - pt_BR    Spanish - es

"""
function describe_trusted_advisor_checks(
    language; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "DescribeTrustedAdvisorChecks",
        Dict{String,Any}("language" => language);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_trusted_advisor_checks(
    language,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return support(
        "DescribeTrustedAdvisorChecks",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("language" => language), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    refresh_trusted_advisor_check(check_id)
    refresh_trusted_advisor_check(check_id, params::Dict{String,<:Any})

Refreshes the Trusted Advisor check that you specify using the check ID. You can get the
check IDs by calling the DescribeTrustedAdvisorChecks operation. Some checks are refreshed
automatically. If you call the RefreshTrustedAdvisorCheck operation to refresh them, you
might see the InvalidParameterValue error. The response contains a
TrustedAdvisorCheckRefreshStatus object.    You must have a Business, Enterprise On-Ramp,
or Enterprise Support plan to use the Amazon Web Services Support API.    If you call the
Amazon Web Services Support API from an account that doesn't have a Business, Enterprise
On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error message
appears. For information about changing your support plan, see Amazon Web Services Support.
   To call the Trusted Advisor operations in the Amazon Web Services Support API, you must
use the US East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe
(Ireland) endpoints don't support the Trusted Advisor operations. For more information, see
About the Amazon Web Services Support API in the Amazon Web Services Support User Guide.

# Arguments
- `check_id`: The unique identifier for the Trusted Advisor check to refresh.  Specifying
  the check ID of a check that is automatically refreshed causes an InvalidParameterValue
  error.

"""
function refresh_trusted_advisor_check(
    checkId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "RefreshTrustedAdvisorCheck",
        Dict{String,Any}("checkId" => checkId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function refresh_trusted_advisor_check(
    checkId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "RefreshTrustedAdvisorCheck",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("checkId" => checkId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    resolve_case()
    resolve_case(params::Dict{String,<:Any})

Resolves a support case. This operation takes a caseId and returns the initial and final
state of the case.    You must have a Business, Enterprise On-Ramp, or Enterprise Support
plan to use the Amazon Web Services Support API.    If you call the Amazon Web Services
Support API from an account that doesn't have a Business, Enterprise On-Ramp, or Enterprise
Support plan, the SubscriptionRequiredException error message appears. For information
about changing your support plan, see Amazon Web Services Support.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"caseId"`: The support case ID requested or returned in the call. The case ID is an
  alphanumeric string formatted as shown in this example:
  case-12345678910-2013-c4c1d2bf33c5cf47
"""
function resolve_case(; aws_config::AbstractAWSConfig=global_aws_config())
    return support("ResolveCase"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET)
end
function resolve_case(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return support(
        "ResolveCase", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
