#!/usr/bin/env bash

source "$PR_SIZE_LABELER_HOME/src/ensure.sh"
source "$PR_SIZE_LABELER_HOME/src/github.sh"
source "$PR_SIZE_LABELER_HOME/src/github_actions.sh"
source "$PR_SIZE_LABELER_HOME/src/labeler.sh"
source "$PR_SIZE_LABELER_HOME/src/misc.sh"

##? Adds a size label to a GitHub Pull Request
##?
##? Usage:
##?   main.sh --github_token=<token> --xs_label=<label> --xs_max_size=<size> --s_label=<label> --s_max_size=<size> --m_label=<label> --m_max_size=<size> --l_label=<label> --l_max_size=<size> --xl_label=<label> --fail_if_xl=<false> --message_if_xl=<message> --github_api_url=<url> --files_to_ignore=<files> --ignore_line_deletions=<false> --ignore_file_deletions=<false>
main() {
  #eval "$(/root/bin/docpars -h "$(grep "^##?" "$PR_SIZE_LABELER_HOME/src/main.sh" | cut -c 5-)" : "$@")"

  ensure::env_variable_exist "GITHUB_REPOSITORY"
  ensure::env_variable_exist "GITHUB_EVENT_PATH"

  export GITHUB_TOKEN="$INPUT_GITHUB_TOKEN"
  export GITHUB_API_URL="$INPUT_GITHUB_API_URL"

  labeler::label \
    "$INPUT_XS_LABEL" \
    "$INPUT_XS_MAX_SIZE" \
    "$INPUT_S_LABEL" \
    "$INPUT_S_MAX_SIZE" \
    "$INPUT_M_LABEL" \
    "$INPUT_M_MAX_SIZE" \
    "$INPUT_L_LABEL" \
    "$INPUT_L_MAX_SIZE" \
    "$INPUT_XL_LABEL" \
    "$INPUT_FAIL_IF_XL" \
    "$INPUT_MESSAGE_IF_XL" \
    "$INPUT_FILES_TO_IGNORE" \
    "$INPUT_IGNORE_LINE_DELETIONS" \
    "$INPUT_IGNORE_FILE_DELETIONS"

  exit $?
}
