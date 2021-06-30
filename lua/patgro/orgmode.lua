require('orgmode').setup {
    org_agenda_files = '~/org/*',
    org_default_notes_file = '~/org/refile.org',
    org_todo_keywords = {'TODO', 'NEXT', 'STARTED', '|', 'DONE', 'CANCEL'},
    org_agenda_templates = {
        c = {description= 'Code Change', template= '* TODO %?\n %a'},
        t = {description= 'Task', template= '* TODO %?\n %u'},
        a = {description= 'Appointment', template= '* Appointment\n %u'}
    }
}
