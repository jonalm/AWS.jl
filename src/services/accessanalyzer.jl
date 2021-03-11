# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: accessanalyzer
using AWS.Compat
using AWS.UUIDs

"""
    apply_archive_rule(analyzer_arn, rule_name)
    apply_archive_rule(analyzer_arn, rule_name, params::Dict{String,<:Any})

Retroactively applies the archive rule to existing findings that meet the archive rule
criteria.

# Arguments
- `analyzer_arn`: The Amazon resource name (ARN) of the analyzer.
- `rule_name`: The name of the rule to apply.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: A client token.
"""
apply_archive_rule(analyzerArn, ruleName; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/archive-rule", Dict{String, Any}("analyzerArn"=>analyzerArn, "ruleName"=>ruleName, "clientToken"=>string(uuid4())); aws_config=aws_config)
apply_archive_rule(analyzerArn, ruleName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/archive-rule", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn, "ruleName"=>ruleName, "clientToken"=>string(uuid4())), params)); aws_config=aws_config)

"""
    create_access_preview(analyzer_arn, configurations)
    create_access_preview(analyzer_arn, configurations, params::Dict{String,<:Any})

Creates an access preview that allows you to preview Access Analyzer findings for your
resource before deploying resource permissions.

# Arguments
- `analyzer_arn`: The ARN of the account analyzer used to generate the access preview. You
  can only create an access preview for analyzers with an Account type and Active status.
- `configurations`: Access control configuration for your resource that is used to generate
  the access preview. The access preview includes findings for external access allowed to the
  resource with the proposed access control configuration. The configuration must contain
  exactly one element.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: A client token.
"""
create_access_preview(analyzerArn, configurations; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/access-preview", Dict{String, Any}("analyzerArn"=>analyzerArn, "configurations"=>configurations, "clientToken"=>string(uuid4())); aws_config=aws_config)
create_access_preview(analyzerArn, configurations, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/access-preview", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn, "configurations"=>configurations, "clientToken"=>string(uuid4())), params)); aws_config=aws_config)

"""
    create_analyzer(analyzer_name, type)
    create_analyzer(analyzer_name, type, params::Dict{String,<:Any})

Creates an analyzer for your account.

# Arguments
- `analyzer_name`: The name of the analyzer to create.
- `type`: The type of analyzer to create. Only ACCOUNT and ORGANIZATION analyzers are
  supported. You can create only one analyzer per account per Region. You can create up to 5
  analyzers per organization per Region.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"archiveRules"`: Specifies the archive rules to add for the analyzer. Archive rules
  automatically archive findings that meet the criteria you define for the rule.
- `"clientToken"`: A client token.
- `"tags"`: The tags to apply to the analyzer.
"""
create_analyzer(analyzerName, type; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/analyzer", Dict{String, Any}("analyzerName"=>analyzerName, "type"=>type, "clientToken"=>string(uuid4())); aws_config=aws_config)
create_analyzer(analyzerName, type, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/analyzer", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerName"=>analyzerName, "type"=>type, "clientToken"=>string(uuid4())), params)); aws_config=aws_config)

"""
    create_archive_rule(analyzer_name, filter, rule_name)
    create_archive_rule(analyzer_name, filter, rule_name, params::Dict{String,<:Any})

Creates an archive rule for the specified analyzer. Archive rules automatically archive new
findings that meet the criteria you define when you create the rule.

# Arguments
- `analyzer_name`: The name of the created analyzer.
- `filter`: The criteria for the rule.
- `rule_name`: The name of the rule to create.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: A client token.
"""
create_archive_rule(analyzerName, filter, ruleName; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/analyzer/$(analyzerName)/archive-rule", Dict{String, Any}("filter"=>filter, "ruleName"=>ruleName, "clientToken"=>string(uuid4())); aws_config=aws_config)
create_archive_rule(analyzerName, filter, ruleName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/analyzer/$(analyzerName)/archive-rule", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("filter"=>filter, "ruleName"=>ruleName, "clientToken"=>string(uuid4())), params)); aws_config=aws_config)

"""
    delete_analyzer(analyzer_name)
    delete_analyzer(analyzer_name, params::Dict{String,<:Any})

Deletes the specified analyzer. When you delete an analyzer, Access Analyzer is disabled
for the account or organization in the current or specific Region. All findings that were
generated by the analyzer are deleted. You cannot undo this action.

# Arguments
- `analyzer_name`: The name of the analyzer to delete.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: A client token.
"""
delete_analyzer(analyzerName; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("DELETE", "/analyzer/$(analyzerName)", Dict{String, Any}("clientToken"=>string(uuid4())); aws_config=aws_config)
delete_analyzer(analyzerName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("DELETE", "/analyzer/$(analyzerName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("clientToken"=>string(uuid4())), params)); aws_config=aws_config)

"""
    delete_archive_rule(analyzer_name, rule_name)
    delete_archive_rule(analyzer_name, rule_name, params::Dict{String,<:Any})

Deletes the specified archive rule.

# Arguments
- `analyzer_name`: The name of the analyzer that associated with the archive rule to delete.
- `rule_name`: The name of the rule to delete.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: A client token.
"""
delete_archive_rule(analyzerName, ruleName; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("DELETE", "/analyzer/$(analyzerName)/archive-rule/$(ruleName)", Dict{String, Any}("clientToken"=>string(uuid4())); aws_config=aws_config)
delete_archive_rule(analyzerName, ruleName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("DELETE", "/analyzer/$(analyzerName)/archive-rule/$(ruleName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("clientToken"=>string(uuid4())), params)); aws_config=aws_config)

"""
    get_access_preview(access_preview_id, analyzer_arn)
    get_access_preview(access_preview_id, analyzer_arn, params::Dict{String,<:Any})

Retrieves information about an access preview for the specified analyzer.

# Arguments
- `access_preview_id`: The unique ID for the access preview.
- `analyzer_arn`: The ARN of the analyzer used to generate the access preview.

"""
get_access_preview(accessPreviewId, analyzerArn; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/access-preview/$(accessPreviewId)", Dict{String, Any}("analyzerArn"=>analyzerArn); aws_config=aws_config)
get_access_preview(accessPreviewId, analyzerArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/access-preview/$(accessPreviewId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn), params)); aws_config=aws_config)

"""
    get_analyzed_resource(analyzer_arn, resource_arn)
    get_analyzed_resource(analyzer_arn, resource_arn, params::Dict{String,<:Any})

Retrieves information about a resource that was analyzed.

# Arguments
- `analyzer_arn`: The ARN of the analyzer to retrieve information from.
- `resource_arn`: The ARN of the resource to retrieve information about.

"""
get_analyzed_resource(analyzerArn, resourceArn; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzed-resource", Dict{String, Any}("analyzerArn"=>analyzerArn, "resourceArn"=>resourceArn); aws_config=aws_config)
get_analyzed_resource(analyzerArn, resourceArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzed-resource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn, "resourceArn"=>resourceArn), params)); aws_config=aws_config)

"""
    get_analyzer(analyzer_name)
    get_analyzer(analyzer_name, params::Dict{String,<:Any})

Retrieves information about the specified analyzer.

# Arguments
- `analyzer_name`: The name of the analyzer retrieved.

"""
get_analyzer(analyzerName; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzer/$(analyzerName)"; aws_config=aws_config)
get_analyzer(analyzerName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzer/$(analyzerName)", params; aws_config=aws_config)

"""
    get_archive_rule(analyzer_name, rule_name)
    get_archive_rule(analyzer_name, rule_name, params::Dict{String,<:Any})

Retrieves information about an archive rule. To learn about filter keys that you can use to
create an archive rule, see Access Analyzer filter keys in the IAM User Guide.

# Arguments
- `analyzer_name`: The name of the analyzer to retrieve rules from.
- `rule_name`: The name of the rule to retrieve.

"""
get_archive_rule(analyzerName, ruleName; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzer/$(analyzerName)/archive-rule/$(ruleName)"; aws_config=aws_config)
get_archive_rule(analyzerName, ruleName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzer/$(analyzerName)/archive-rule/$(ruleName)", params; aws_config=aws_config)

"""
    get_finding(analyzer_arn, id)
    get_finding(analyzer_arn, id, params::Dict{String,<:Any})

Retrieves information about the specified finding.

# Arguments
- `analyzer_arn`: The ARN of the analyzer that generated the finding.
- `id`: The ID of the finding to retrieve.

"""
get_finding(analyzerArn, id; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/finding/$(id)", Dict{String, Any}("analyzerArn"=>analyzerArn); aws_config=aws_config)
get_finding(analyzerArn, id, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/finding/$(id)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn), params)); aws_config=aws_config)

"""
    list_access_preview_findings(access_preview_id, analyzer_arn)
    list_access_preview_findings(access_preview_id, analyzer_arn, params::Dict{String,<:Any})

Retrieves a list of access preview findings generated by the specified access preview.

# Arguments
- `access_preview_id`: The unique ID for the access preview.
- `analyzer_arn`: The ARN of the analyzer used to generate the access.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filter"`: Criteria to filter the returned findings.
- `"maxResults"`: The maximum number of results to return in the response.
- `"nextToken"`: A token used for pagination of results returned.
"""
list_access_preview_findings(accessPreviewId, analyzerArn; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/access-preview/$(accessPreviewId)", Dict{String, Any}("analyzerArn"=>analyzerArn); aws_config=aws_config)
list_access_preview_findings(accessPreviewId, analyzerArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/access-preview/$(accessPreviewId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn), params)); aws_config=aws_config)

"""
    list_access_previews(analyzer_arn)
    list_access_previews(analyzer_arn, params::Dict{String,<:Any})

Retrieves a list of access previews for the specified analyzer.

# Arguments
- `analyzer_arn`: The ARN of the analyzer used to generate the access preview.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in the response.
- `"nextToken"`: A token used for pagination of results returned.
"""
list_access_previews(analyzerArn; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/access-preview", Dict{String, Any}("analyzerArn"=>analyzerArn); aws_config=aws_config)
list_access_previews(analyzerArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/access-preview", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn), params)); aws_config=aws_config)

"""
    list_analyzed_resources(analyzer_arn)
    list_analyzed_resources(analyzer_arn, params::Dict{String,<:Any})

Retrieves a list of resources of the specified type that have been analyzed by the
specified analyzer..

# Arguments
- `analyzer_arn`: The ARN of the analyzer to retrieve a list of analyzed resources from.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in the response.
- `"nextToken"`: A token used for pagination of results returned.
- `"resourceType"`: The type of resource.
"""
list_analyzed_resources(analyzerArn; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/analyzed-resource", Dict{String, Any}("analyzerArn"=>analyzerArn); aws_config=aws_config)
list_analyzed_resources(analyzerArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/analyzed-resource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn), params)); aws_config=aws_config)

"""
    list_analyzers()
    list_analyzers(params::Dict{String,<:Any})

Retrieves a list of analyzers.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in the response.
- `"nextToken"`: A token used for pagination of results returned.
- `"type"`: The type of analyzer.
"""
list_analyzers(; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzer"; aws_config=aws_config)
list_analyzers(params::AbstractDict{String, Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzer", params; aws_config=aws_config)

"""
    list_archive_rules(analyzer_name)
    list_archive_rules(analyzer_name, params::Dict{String,<:Any})

Retrieves a list of archive rules created for the specified analyzer.

# Arguments
- `analyzer_name`: The name of the analyzer to retrieve rules from.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of results to return in the request.
- `"nextToken"`: A token used for pagination of results returned.
"""
list_archive_rules(analyzerName; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzer/$(analyzerName)/archive-rule"; aws_config=aws_config)
list_archive_rules(analyzerName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/analyzer/$(analyzerName)/archive-rule", params; aws_config=aws_config)

"""
    list_findings(analyzer_arn)
    list_findings(analyzer_arn, params::Dict{String,<:Any})

Retrieves a list of findings generated by the specified analyzer. To learn about filter
keys that you can use to retrieve a list of findings, see Access Analyzer filter keys in
the IAM User Guide.

# Arguments
- `analyzer_arn`: The ARN of the analyzer to retrieve findings from.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"filter"`: A filter to match for the findings to return.
- `"maxResults"`: The maximum number of results to return in the response.
- `"nextToken"`: A token used for pagination of results returned.
- `"sort"`: The sort order for the findings returned.
"""
list_findings(analyzerArn; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/finding", Dict{String, Any}("analyzerArn"=>analyzerArn); aws_config=aws_config)
list_findings(analyzerArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/finding", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn), params)); aws_config=aws_config)

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Retrieves a list of tags applied to the specified resource.

# Arguments
- `resource_arn`: The ARN of the resource to retrieve tags from.

"""
list_tags_for_resource(resourceArn; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/tags/$(resourceArn)"; aws_config=aws_config)
list_tags_for_resource(resourceArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("GET", "/tags/$(resourceArn)", params; aws_config=aws_config)

"""
    start_resource_scan(analyzer_arn, resource_arn)
    start_resource_scan(analyzer_arn, resource_arn, params::Dict{String,<:Any})

Immediately starts a scan of the policies applied to the specified resource.

# Arguments
- `analyzer_arn`: The ARN of the analyzer to use to scan the policies applied to the
  specified resource.
- `resource_arn`: The ARN of the resource to scan.

"""
start_resource_scan(analyzerArn, resourceArn; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/resource/scan", Dict{String, Any}("analyzerArn"=>analyzerArn, "resourceArn"=>resourceArn); aws_config=aws_config)
start_resource_scan(analyzerArn, resourceArn, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/resource/scan", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn, "resourceArn"=>resourceArn), params)); aws_config=aws_config)

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds a tag to the specified resource.

# Arguments
- `resource_arn`: The ARN of the resource to add the tag to.
- `tags`: The tags to add to the resource.

"""
tag_resource(resourceArn, tags; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/tags/$(resourceArn)", Dict{String, Any}("tags"=>tags); aws_config=aws_config)
tag_resource(resourceArn, tags, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tags"=>tags), params)); aws_config=aws_config)

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes a tag from the specified resource.

# Arguments
- `resource_arn`: The ARN of the resource to remove the tag from.
- `tag_keys`: The key for the tag to add.

"""
untag_resource(resourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("DELETE", "/tags/$(resourceArn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
untag_resource(resourceArn, tagKeys, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), params)); aws_config=aws_config)

"""
    update_archive_rule(analyzer_name, filter, rule_name)
    update_archive_rule(analyzer_name, filter, rule_name, params::Dict{String,<:Any})

Updates the criteria and values for the specified archive rule.

# Arguments
- `analyzer_name`: The name of the analyzer to update the archive rules for.
- `filter`: A filter to match for the rules to update. Only rules that match the filter are
  updated.
- `rule_name`: The name of the rule to update.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: A client token.
"""
update_archive_rule(analyzerName, filter, ruleName; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/analyzer/$(analyzerName)/archive-rule/$(ruleName)", Dict{String, Any}("filter"=>filter, "clientToken"=>string(uuid4())); aws_config=aws_config)
update_archive_rule(analyzerName, filter, ruleName, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/analyzer/$(analyzerName)/archive-rule/$(ruleName)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("filter"=>filter, "clientToken"=>string(uuid4())), params)); aws_config=aws_config)

"""
    update_findings(analyzer_arn, status)
    update_findings(analyzer_arn, status, params::Dict{String,<:Any})

Updates the status for the specified findings.

# Arguments
- `analyzer_arn`: The ARN of the analyzer that generated the findings to update.
- `status`: The state represents the action to take to update the finding Status. Use
  ARCHIVE to change an Active finding to an Archived finding. Use ACTIVE to change an
  Archived finding to an Active finding.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"clientToken"`: A client token.
- `"ids"`: The IDs of the findings to update.
- `"resourceArn"`: The ARN of the resource identified in the finding.
"""
update_findings(analyzerArn, status; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/finding", Dict{String, Any}("analyzerArn"=>analyzerArn, "status"=>status, "clientToken"=>string(uuid4())); aws_config=aws_config)
update_findings(analyzerArn, status, params::AbstractDict{String, <:Any}; aws_config::AbstractAWSConfig=global_aws_config()) = accessanalyzer("PUT", "/finding", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("analyzerArn"=>analyzerArn, "status"=>status, "clientToken"=>string(uuid4())), params)); aws_config=aws_config)
