I18n.translations || (I18n.translations = {});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"access_restricted":"You don't have permission to access this resource","action_plans":{"create":{"success":"The action plan was successfully created."},"destroy":{"success":"The action plan was successfully destroyed."},"edit":{"title_html":"Editing action plan \u003csmall\u003efor: %{cause}\u003c/small\u003e"},"new":{"title_html":"New action plan \u003csmall\u003efor: %{cause}\u003c/small\u003e"},"show":{"action_plan":"Action plan","cost":"Cost","destroy":"Delete","edit":"Edit","employee":"Employee in charge","evaluation":"Evaluation","evaluation_date":"Evaluation date","how":"How?","title_html":"Action plan \u003csmall\u003efor: %{cause}\u003c/small\u003e"},"update":{"success":"The action plan was successfully updated."}},"activerecord":{"attributes":{"action_plan":{"action_plan":"Action plan","cost":"Cost","employee_id":"Employee in charge","evaluation":"Evaluation","evaluation_date":"Evaluation date","execution_date":"Execution date","how":"How?"},"amef_component":{"detectability":"Detectability","frequency":"Frequency","severity":"Severity"},"complaint":{"batch_number":"Batch number","classification":"Classification","classifications":{"audit_result":"Audit result","complaint":"Complaint","deviation":"Deviation","nonconforming_product":"Noncomforming product","suggestion":"Suggestion","warranty":"Warranty"},"code":"Code","company":"Company","description":"Description","effective_date":"Effective date","expiration_date":"Expiration date","product_id":"Product","review_date":"Review date","source":"Source","source_contact_info":"Source contact info","source_email":"Source email","status":"Status","statuses":{"closed":"Closed","extended":"Extended","open":"Open"}},"eight_ms_analysis":{"consequence":"Consequence","machines":"Machines","management":"Management","manpower":"Manpower","materials":"Materials","measurements":"Measurements","medium":"Medium","methods":"Methods","money":"Money"},"employee":{"admin":"Admin","current_password":"Current password","email":"Email","identification":"Identification","name":"Name","password":"Password","password_confirmation":"Password confirmation","position":"Position"},"fishbone_analysis":{"effect":"Effect"},"fishbone_category":{"category":"Category"},"fishbone_cause":{"cause":"Cause"},"product":{"code":"Code","name":"Name"},"support":{"description":"Description","support_file":"Support file"}},"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"has_many":"Cannot delete record because dependent %{record} exist","has_one":"Cannot delete record because a dependent %{record} exists"}}},"models":{"action_plan":{"one":"Action plan","other":"Action plans","to_s":"Action plan for: %{cause}"},"amef_analysis":{"one":"AMEF Analysis","other":"AMEF Analyses","to_s":"AMEF Analysis for %{effect}"},"amef_component":{"one":"AMEF Analysis Component","other":"AMEF Analysis Components"},"complaint":{"one":"Complaint","other":"Complaints"},"eight_ms_analysis":{"one":"Eight M's Analysis","other":"Eight M's Analyses","to_s":"Eight M's Analysis for: %{consequence}"},"employee":{"one":"Employee","other":"Employees"},"fishbone_analysis":{"one":"Fishbone Analysis","other":"Fishbone Analyses","to_s":"Fishbone Analysis for %{effect}"},"fishbone_category":{"one":"Fishbone Analysis Category","other":"Fishbone Analysis Categories"},"fishbone_cause":{"one":"Fishbone Analysis Cause","other":"Fishbone Analysis Causes"},"product":{"one":"Product","other":"Products"},"support":{"one":"Supporting document","other":"Supporting documents"}}},"amef_analyses":{"create":{"success":"AMEF Analysis was successfully created."},"destroy":{"success":"AMEF Analysis was successfully destroyed."},"form":{"cause":"Cause","detectability":"Detectability","frequency":"Frequency","severity":"Severity"},"new":{"title":"New AMEF Analysis"},"show":{"action_plan":"Action plan","cause":"Cause","destroy":"Delete AMEF Analysis","detectability":"Detectability","frequency":"Frequency","new_action_plan":"New action plan","percentage":"% of risk","severity":"Severity","show_action_plan":"See action plan","show_less":"Show less...","show_more":"Show more...","total":"Total"},"update":{"success":"AMEF Analysis was successfully updated."}},"back":"Back","change_password":"Change password","complaints":{"create":{"success":"Complaint was successfully created."},"destroy":{"success":"Complaint was successfully destroyed."},"edit":{"title":"Editing complaint"},"form":{"contact_employee":"Contact employee","employee":"Employee in charge"},"index":{"batch_number":"Batch number","classification":"Classification","code":"Code","description":"Description","destroy":"Destroy","edit":"Edit","effective_date":"Effective date","new_complaint":"New complaint","product":"Product","review_date":"Review date","show":"Show","source":"Source","status":"Status","title":"Complaints"},"new":{"title":"New complaint"},"show":{"add_analysis":"Add analysis","add_supporting_info":"Add supporting info","analyses":"Analyses","batch_number":"Batch number","classification":"Classification","contact_employee":"Contact employee","description":"Description","edit":"Edit","effective_date":"Effective date","eight_ms_analysis":"Eight M's analysis","employee_in_charge":"Employee in charge","expiration_date":"Expiration date","fishbone_analysis":"Fishbone analysis","product":"Product","review_date":"Review date","source":"Source","source_contact_info":"Source contact info","source_email":"Source email","status":"Status","supporting_info":"Supporting info","title":"Complaint"},"update":{"success":"Complaint was successfully updated."}},"confirmation_question":"Are you sure?","date":{"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"formats":{"default":"%Y-%m-%d","long":"%B %d, %Y","short":"%b %d"},"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"},"half_a_minute":"half a minute","less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"x_days":{"one":"1 day","other":"%{count} days"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"x_months":{"one":"1 month","other":"%{count} months"},"x_seconds":{"one":"1 second","other":"%{count} seconds"}},"prompts":{"day":"Day","hour":"Hour","minute":"Minute","month":"Month","second":"Seconds","year":"Year"}},"devise":{"confirmations":{"confirmed":"Your email address has been successfully confirmed.","send_instructions":"You will receive an email with instructions for how to confirm your email address in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes."},"failure":{"already_authenticated":"You are already signed in.","inactive":"Your account is not activated yet.","invalid":"Invalid %{authentication_keys} or password.","last_attempt":"You have one more attempt before your account is locked.","locked":"Your account is locked.","not_found_in_database":"Invalid %{authentication_keys} or password.","timeout":"Your session expired. Please sign in again to continue.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your email address before continuing."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"email_changed":{"subject":"Email Changed"},"password_change":{"subject":"Password Changed"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock instructions"}},"omniauth_callbacks":{"failure":"Could not authenticate you from %{kind} because \"%{reason}\".","success":"Successfully authenticated from %{kind} account."},"passwords":{"no_token":"You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.","send_instructions":"You will receive an email with instructions on how to reset your password in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","updated":"Your password has been changed successfully. You are now signed in.","updated_not_active":"Your password has been changed successfully."},"registrations":{"destroyed":"Bye! Your account has been successfully cancelled. We hope to see you again soon.","signed_up":"Welcome! You have signed up successfully.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirm link to confirm your new email address.","updated":"Your account has been updated successfully."},"sessions":{"already_signed_out":"Signed out successfully.","new":{"remember_me":"Remember me"},"signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"unlocks":{"send_instructions":"You will receive an email with instructions for how to unlock your account in a few minutes.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions for how to unlock it in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue."}},"does_not_apply":"Does not apply","eight_ms_analyses":{"create":{"success":"Eight M's analysis was successfully created."},"destroy":{"success":"Eight M's analysis was successfully destroyed."},"edit":{"title":"Editing Eight M's Analysis"},"index":{"consequence":"Consequence","destroy":"Destroy","edit":"Edit","machines":"Machines","management":"Management","manpower":"Manpower","materials":"Materials","measurements":"Measurements","medium":"Medium","methods":"Methods","money":"Money","new_eight_ms_analysis":"New Eight M's Analysis","show":"Show","title":"Eight M's Analyses for complaint %{complaint}"},"new":{"title":"New Eight M's Analysis"},"show":{"consequence":"Consequence","delete":"Delete","edit":"Edit","machines":"Machines","management":"Management","manpower":"Manpower","materials":"Materials","measurements":"Measurements","medium":"Medium","methods":"Methods","money":"Money"},"update":{"success":"Eight M's analysis was successfully updated."}},"employee_mailer":{"complaint_redirected_email":{"subject":"New complaint investigation assigned"}},"employees":{"create":{"success":"Employee was successfully created."},"destroy":{"success":"Employee was successfully destroyed."},"edit":{"title":"Editing Employee"},"edit_password":{"title":"Change my password"},"index":{"destroy":"Destroy","edit":"Edit","email":"Email","identification":"Identification","name":"Name","new_employee":"New employee","position":"Position","show":"Show","title":"Employees"},"new":{"title":"New Employee"},"show":{"edit":"Edit","email":"Email","identification":"Identification","position":"Position"},"sign_in":{"confirmation_instructions":"Didn't receive confirmation instructions?","forgot_password":"Forgot your password?","remember_me":"Remember me"},"update":{"success":"Employee was successfully updated."},"update_password":{"success":"Your password has been changed."}},"entity_not_found":"%{entity} not found","errors":{"connection_refused":"Oops! Failed to connect to the Web Console middleware.\nPlease make sure a rails development server is running.\n","format":"%{attribute} %{message}","messages":{"accepted":"must be accepted","already_confirmed":"was already confirmed, please try signing in","blank":"can't be blank","confirmation":"doesn't match %{attribute}","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one","empty":"can't be empty","equal_to":"must be equal to %{count}","even":"must be even","exclusion":"is reserved","expired":"has expired, please request a new one","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","inclusion":"is not included in the list","invalid":"is invalid","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","model_invalid":"Validation failed: %{errors}","not_a_number":"is not a number","not_an_integer":"must be an integer","not_found":"not found","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"},"odd":"must be odd","other_than":"must be other than %{count}","present":"must be blank","required":"must exist","taken":"has already been taken","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"}},"unacceptable_request":"A supported version is expected in the Accept header.\n","unavailable_session":"Session %{id} is no longer available in memory.\n\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\nthis request hit doesn't store %{id} in memory. Consider turning the number of\nprocesses/workers to one (1) or using a different server in development.\n"},"filter_by":"Filter by...","fishbone_analyses":{"create":{"success":"Fishbone analysis was successfully created."},"destroy":{"success":"Fishbone analysis was successfully destroyed."},"form":{"category":"Category","cause":"Cause"},"index":{"destroy":"Destroy","edit":"Edit","effect":"Effect","new_fishbone_analysis":"New Fishbone Analysis","show":"Show","title":"Fishbone Analyses for %{complaint}"},"new":{"title":"New Fishbone Analysis"},"show":{"category":"Category","cause":"Cause","delete":"Delete","effect":"Effect","new_amef_analysis":"New AMEF analysis"}},"flash":{"actions":{"create":{"notice":"%{resource_name} was successfully created."},"destroy":{"alert":"%{resource_name} could not be destroyed.","notice":"%{resource_name} was successfully destroyed."},"update":{"notice":"%{resource_name} was successfully updated."}}},"helpers":{"select":{"prompt":"Please select"},"submit":{"amef_analysis":{"create":"Create %{model}","update":"Update %{model}"},"complaint":{"create":"Create %{model}","update":"Update %{model}"},"create":"Create %{model}","employee":{"create":"Create %{model}","update":"Update %{model}"},"fishbone_analysis":{"create":"Create %{model}"},"five_m_analysis":{"create":"Create %{model}","update":"Update %{model}"},"product":{"create":"Create %{model}","update":"Update %{model}"},"submit":"Save %{model}","support":{"create":"Create %{model}","update":"Update %{model}"},"update":"Update %{model}"}},"my_account":"My account","number":{"currency":{"format":{"delimiter":",","format":"%u%n","precision":2,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"$"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"Billion","million":"Million","quadrillion":"Quadrillion","thousand":"Thousand","trillion":"Trillion","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"eb":"EB","gb":"GB","kb":"KB","mb":"MB","pb":"PB","tb":"TB"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"products":{"create":{"success":"Product was successfully created."},"destroy":{"success":"Product was successfully destroyed."},"edit":{"title":"Editing Product"},"index":{"code":"Code","destroy":"Destroy","edit":"Edit","name":"Name","new_product":"New product","title":"Product"},"new":{"title":"New product"},"show":{"code":"Code","edit":"Edit","name":"Name"},"update":{"success":"Product was successfully updated."}},"save_changes":"Save changes","search":"Search","select_if_needed":"Please select if needed","support":{"array":{"last_word_connector":", and ","two_words_connector":" and ","words_connector":", "}},"supports":{"create":{"success":"Support was successfully created."},"destroy":{"success":"Support was successfully destroyed."},"edit":{"title":"Editing Support Document"},"form":{"current_file":"Current file"},"index":{"complaint":"Complaint","description":"Description","destroy":"Destroy","download":"Download %{filename}","edit":"Edit","new_support":"New Support","show":"Show","support_file":"Support file","title":"Supporting Documents"},"new":{"title":"New Support"},"show":{"description":"Description","edit":"Edit","file":"File","title":"Support file for complaint"},"update":{"success":"Support was successfully updated."}},"time":{"am":"am","formats":{"default":"%a, %d %b %Y %H:%M:%S %z","long":"%B %d, %Y %H:%M","short":"%d %b %H:%M"},"pm":"pm"},"will_paginate":{"next_label":"Next \u0026#8594;","page_entries_info":{"multi_page":"Displaying %{model} %{from} - %{to} of %{count} in total","multi_page_html":"Displaying %{model} \u003cb\u003e%{from}\u0026nbsp;-\u0026nbsp;%{to}\u003c/b\u003e of \u003cb\u003e%{count}\u003c/b\u003e in total","single_page":{"one":"Displaying 1 %{model}","other":"Displaying all %{count} %{model}","zero":"No %{model} found"},"single_page_html":{"one":"Displaying \u003cb\u003e1\u003c/b\u003e %{model}","other":"Displaying \u003cb\u003eall\u0026nbsp;%{count}\u003c/b\u003e %{model}","zero":"No %{model} found"}},"page_gap":"\u0026hellip;","previous_label":"\u0026#8592; Previous"}});
I18n.translations["es"] = I18n.extend((I18n.translations["es"] || {}), {"access_restricted":"No tiene permiso para acceder a este recurso","action_plans":{"create":{"success":"El plan de acción fue registrado exitosamente."},"destroy":{"success":"El plan de acción fue eliminado exitosamente"},"edit":{"title_html":"Editar plan de acción \u003csmall\u003epara: %{cause}\u003c/small\u003e"},"new":{"title_html":"Nuevo plan de acción \u003csmall\u003epara: %{cause}\u003c/small\u003e"},"show":{"action_plan":"Plan de acción","cost":"Costo","destroy":"Eliminar","edit":"Editar","employee":"Empleado encargado","evaluation":"Evaluación","evaluation_date":"Fecha de evaluación","how":"¿Cómo?","title_html":"Plan de acción \u003csmall\u003epara: %{cause}\u003c/small\u003e"},"update":{"success":"El plan de acción fue actualizado exitosamente"}},"activerecord":{"attributes":{"action_plan":{"action_plan":"Plan de acción","cost":"Costo","employee_id":"Empleado encargado","evaluation":"Evaluación","evaluation_date":"Fecha de evaluación","execution_date":"Fecha de ejecución","how":"¿Cómo?"},"amef_component":{"detectability":"Detectabilidad","frequency":"Frecuencia","severity":"Severidad"},"complaint":{"batch_number":"Número de lote","classification":"Clasificación","classifications":{"audit_result":"Resultado de auditoría","complaint":"Queja","deviation":"Desviación","nonconforming_product":"Producto no conforme","suggestion":"Sugerencia","warranty":"Garantía"},"code":"Código","company":"Compañía","description":"Descripción","effective_date":"Fecha efectiva","expiration_date":"Fecha de expiración","product_id":"Producto","review_date":"Fecha de revisión","source":"Fuente","source_contact_info":"Información de contacto de la fuente","source_email":"Correo de la fuente","status":"Estado","statuses":{"closed":"Cerrada","extended":"Extendida","open":"Abierta"}},"eight_ms_analysis":{"consequence":"Consecuencia","machines":"Maquinaria","management":"Management","manpower":"Mano de obra","materials":"Materiales","measurements":"Medidas","medium":"Medio ambiente","methods":"Metodología","money":"Money (Costos)"},"employee":{"admin":"Administrador","current_password":"Contraseña actual","email":"Email","identification":"Identificación","name":"Nombre","password":"Contraseña","password_confirmation":"Confirmar nueva contraseña","position":"Posición"},"fishbone_analysis":{"effect":"Efecto"},"fishbone_category":{"category":"Categoría"},"fishbone_cause":{"cause":"Causa"},"product":{"code":"Código","name":"Nombre"},"support":{"description":"Descripción","support_file":"Archivo de soporte"}},"models":{"action_plan":{"one":"Plan de acción","other":"Planes de acción","to_s":"Plan de acción para: %{cause}"},"amef_analysis":{"one":"Análisis AMEF","other":"Análisis AMEF","to_s":"Análisis AMEF para: %{effect}"},"amef_component":{"one":"Componente de análisis AMEF","other":"Componentes de análisis AMEF"},"complaint":{"one":"Queja","other":"Quejas"},"eight_ms_analysis":{"one":"Análisis de ocho emes","other":"Análisis de ocho emes","to_s":"Análisis de ocho emes para: %{consequence}"},"employee":{"one":"Empleado","other":"Empleados"},"fishbone_analysis":{"one":"Análisis de Ishikawa","other":"Análisis de Ishikawa","to_s":"Análisis de Ishikawa para: %{effect}"},"fishbone_category":{"one":"Categoría de análisis de Ishikawa","other":"Categorías de análisis de Ishikawa"},"fishbone_cause":{"one":"Causa de análisis de Ishikawa","other":"Causas de análisis de Ishikawa"},"product":{"one":"Producto","other":"Productos"},"support":{"one":"Documento de soporte","other":"Documentos de soporte"}}},"amef_analyses":{"create":{"success":"El análisis AMEF fue creado exitósamente"},"destroy":{"success":"El análisis AMEF fue eliminado exitósamente"},"form":{"cause":"Causa","detectability":"Detectabilidad","frequency":"Frecuencia","severity":"Severidad"},"show":{"action_plan":"Plan de acción","cause":"Causa","destroy":"Eliminar análisis AMEF","detectability":"Detectabilidad","frequency":"Frecuencia","new_action_plan":"Registrar plan de acción","percentage":"% de Riesgo","severity":"Severidad","show_action_plan":"Ver plan de acción","show_less":"Ver menos...","show_more":"Ver más...","total":"Total"},"update":{"success":"El análisis AMEF fue actualizado exitósamente"}},"back":"Atras","change_password":"Cambiar contraseña","complaints":{"create":{"success":"La queja fue registrada exitosamente."},"destroy":{"success":"La queja fue eliminada exitosamente."},"edit":{"title":"Editando queja"},"form":{"contact_employee":"Empleado de contacto","employee":"Empleado encargado"},"index":{"batch_number":"Número de lote","classification":"Clasificación","code":"Código","description":"Descripción","destroy":"Eliminar","edit":"Editar","effective_date":"Fecha efectiva","new_complaint":"Registrar queja","product":"Producto","review_date":"Fecha de revisión","show":"Ver","source":"Fuente","status":"Estado","title":"Quejas"},"new":{"title":"Nueva queja"},"show":{"add_analysis":"Añadir análisis","add_supporting_info":"Añadir información de soporte","analyses":"Análisis","batch_number":"Número de lote","classification":"Clasificación","contact_employee":"Empleado de contacto","description":"Descripción","edit":"Editar","effective_date":"Fecha efectiva","eight_ms_analysis":"Análisis de ocho emes","employee_in_charge":"Empleado encargado","expiration_date":"Fecha de expiración","fishbone_analysis":"Análisis de Ishikawa","product":"Producto","review_date":"Fecha de revisión","source":"Fuente","source_contact_info":"Información de contacto de la fuente","source_email":"Correo de la fuente","status":"Estado","supporting_info":"Información de soporte","title":"Queja"},"update":{"success":"La queja fue actualizada exitosamente."}},"confirmation_question":"¿Estás seguro?","devise":{"confirmations":{"confirmed":"Tu correo electrónico ha sido confirmado exitosamente.","send_instructions":"En unos minutos recibirás un correo con instrucciones para confirmar tu correo electrónico.","send_paranoid_instructions":"Si tu correo electrónico existe en nuestra base de datos, en unos minutos recibirás un correo electrónico con instrucciones para confirmar tu cuenta."},"failure":{"already_authenticated":"Ya te encuentras autenticado.","inactive":"Tu cuenta aún no ha sido activada.","invalid":"%{authentication_keys} o contraseña inválidos.","last_attempt":"Tienes un último intento antes de que tu cuenta sea bloqueada.","locked":"Tu cuenta se encuentra bloqueada.","not_found_in_database":"%{authentication_keys} o contraseña inválidos.","timeout":"Tu sesión ha expirado. Por favor vuelve a iniciar sesión para continuar.","unauthenticated":"Debes iniciar sesión antes de continuar.","unconfirmed":"Debes confirmar tu correo electrónico antes de continuar."},"mailer":{"confirmation_instructions":{"subject":"Instrucciones de confirmación"},"email_changed":{"subject":"Correo cambiado"},"password_change":{"subject":"Contraseña cambiada"},"reset_password_instructions":{"subject":"Instrucciones para resetear contraseña"},"unlock_instructions":{"subject":"Instrucciones de desbloqueo"}},"omniauth_callbacks":{"failure":"No hemos podido autenticarte desde %{kind} porque \"%{reason}\".","success":"Autenticado exitosamente desde %{kind}."},"passwords":{"no_token":"No puedes acceder a esta página sin llegar desde un correo de reestrablecimiento de contraseña. Si llegaste desde un correo de reestrablecimiento de contraseña, por favor asegurate de haber usado la URL completa.","send_instructions":"Recibirás instrucciones para reestablecer tu contraseña en unos minutos.","send_paranoid_instructions":"Si tu correo electrónico existe en nuestra base de datos, recibiras un link de recuperación de cuenta en tu correo en unos minutos.","updated":"Tu contraseña ha sido cambiada exitosamente. Has ingresado a la plataforma.","updated_not_active":"Tu contraseña ha sido cambiada exitosamente."},"registrations":{"destroyed":"Tu cuenta ha sido cancelada.","signed_up":"Bienvenido! Has ingresado exitosamente.","signed_up_but_inactive":"Te has registrado exitosamente. Sin embargo, aún no puedes ingresar puesto que tu cuenta no ha sido activada.","signed_up_but_locked":"Te has registrado exitosamente. Sin embargo, aún no puedes ingresar puesto que tu cuenta se encuentra bloqueada.","signed_up_but_unconfirmed":"Un mensaje con un link de confirmación ha sido enviado a tu correo electrónico. Por favor ingresa al link para activar tu cuenta.","update_needs_confirmation":"Tu cuenta ha sido actualizada exitosamente, pero necesitamos verificar tu nuevo correo electrónico. Por favor revisa tu correo y sigue el link para confirmar tu nuevo correo electrónico.","updated":"Tu cuenta ha sido actualizada exitosamente."},"sessions":{"already_signed_out":"Salida exitosa.","new":{"remember_me":"Recuerdame"},"signed_in":"Ingreso exitoso.","signed_out":"Salida exitosa."},"unlocks":{"send_instructions":"Recibirás un correo con instrucciones para desbloquear tu cuenta en unos minutos.","send_paranoid_instructions":"Si tu cuenta existe, recibirás un correo con instrucciones para desbloquearla en unos minutos.","unlocked":"Tu cuenta ha sido desbloqueada exitosamente. Por favor inicia sesión para continuar."}},"does_not_apply":"No aplica","eight_ms_analyses":{"create":{"success":"El análisis de ocho emes fue creado exitosamente."},"destroy":{"success":"El análisis de ocho emes fue destruido exitosamente."},"edit":{"title":"Editando análisis de ocho emes"},"index":{"consequence":"Consecuencia","destroy":"Eliminar","edit":"Editar","machines":"Maquinaria","management":"Management","manpower":"Mano de obra","materials":"Materiales","measurements":"Medidas","medium":"Medio ambiente","methods":"Metodología","money":"Money (Costos)","new_eight_ms_analysis":"Nuevo análisis de ocho emes","show":"Ver","title":"Análisis de ocho emes para la queja %{complaint}"},"new":{"title":"Nuevo análisis de ocho emes"},"show":{"consequence":"Consecuencia","delete":"Eliminar","edit":"Editar","machines":"Maquinaria","management":"Management","manpower":"Mano de obra","materials":"Materiales","measurements":"Medidas","medium":"Medio ambiente","methods":"Metodología","money":"Money (Costos)"},"update":{"success":"El análisis de ocho emes fue actualizado exitosamente."}},"employee_mailer":{"complaint_redirected_email":{"subject":"Nueva investigación de queja asignada"}},"employees":{"create":{"success":"El empleado fue registrado exitosamente."},"destroy":{"success":"El empleado fue eliminado exitosamente."},"edit":{"title":"Editando empleado"},"edit_password":{"title":"Cambiar mi contraseña"},"index":{"destroy":"Eliminar","edit":"Editar","email":"Email","identification":"Identificación","name":"Nombre","new_employee":"Registrar empleado","position":"Posición","show":"Ver","title":"Empleados"},"new":{"title":"Registrar empleado"},"show":{"edit":"Editar","email":"Email","identification":"Identificación","position":"Posición"},"sign_in":{"confirmation_instructions":"¿No has recibido instrucciones de confirmación?","forgot_password":"¿Olvidaste tu contraseña?","remember_me":"Recuerdame"},"update":{"success":"El empleado fue actualizado exitosamente."},"update_password":{"success":"Tu contraseña ha sido cambiada exitosamente."}},"entity_not_found":"%{entity} no encontrado","errors":{"messages":{"already_confirmed":"ya fue confirmada, por favor trata de iniciar sesión","confirmation_period_expired":"necesita se confirmada dentro de %{period}, por favor solicita una nueva confirmación","expired":"ha expirado, por favor solicita una nueva","not_found":"no encontrado","not_locked":"no bloqueado","not_saved":{"one":"1 error prohibió guardar este %{resource}:","other":"%{count} errores prohibieron guardar este %{resource}:"}}},"filter_by":"Filtrar por...","fishbone_analyses":{"create":{"success":"El análisis de Ishikawa fue creado exitosamente."},"destroy":{"success":"El análisis de Ishikawa fue eliminado exitosamente."},"form":{"category":"Categoría","cause":"Causa"},"index":{"destroy":"Eliminar","edit":"Editar","effect":"Efecto","new_fishbone_analysis":"Nuevo análisis de Ishikawa","show":"Ver","title":"Análisis de Ishikawa para %{complaint}"},"new":{"title":"Nuevo análisis de Ishikawa"},"show":{"category":"Categoría","cause":"Causa","delete":"Eliminar","effect":"Efecto","new_amef_analysis":"Registrar análisis AMEF"}},"helpers":{"submit":{"action_plan":{"create":"Registrar %{model}","update":"Actualizar %{model}"},"amef_analysis":{"create":"Registrar %{model}","update":"Actualizar %{model}"},"complaint":{"create":"Registrar %{model}","update":"Actualizar %{model}"},"eight_ms_analysis":{"create":"Registrar %{model}","update":"Actualizar %{model}"},"employee":{"create":"Registrar %{model}","update":"Actualizar %{model}"},"fishbone_analysis":{"create":"Crear %{model}"},"product":{"create":"Registrar %{model}","update":"Actualizar %{model}"},"support":{"create":"Adjuntar %{model}","update":"Actualizar %{model}"}}},"my_account":"Mi cuenta","products":{"create":{"success":"El producto fue registrado exitosamente."},"destroy":{"success":"El producto fue eliminado exitosamente."},"edit":{"title":"Editando producto"},"index":{"code":"Código","destroy":"Eliminar","edit":"Editar","name":"Nombre","new_product":"Registrar producto","title":"Producto"},"new":{"title":"Nuevo producto"},"show":{"code":"Código","edit":"Editar","name":"Nombre"},"update":{"success":"El producto fue actualizado exitosamente."}},"save_changes":"Guardar cambios","search":"Buscar","select_if_needed":"Selecciona si es necesario","supports":{"create":{"success":"La información de soporte fue registrada exitosamente."},"destroy":{"success":"La información de soporte fue eliminada exitosamente."},"edit":{"title":"Editando documento de soporte"},"form":{"current_file":"Archivo actual"},"index":{"complaint":"Queja","description":"Descripción","destroy":"Eliminar","download":"Descargar %{filename}","edit":"Editar","new_support":"Añadir documento de soporte","show":"Ver","support_file":"Archivo de soporte","title":"Documentos de soporte"},"new":{"title":"Nuevo documento de soporte"},"show":{"description":"Descripción","edit":"Editar","file":"Archivo","title":"Documento de soporte para la queja"},"update":{"success":"La información de soporte fue actualizada exitosamente."}},"will_paginate":{"next_label":"Siguiente \u0026#8594;","page_gap":"\u0026hellip;","previous_label":"\u0026#8592; Atras"}});
