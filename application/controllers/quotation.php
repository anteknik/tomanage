<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Quotation extends MY_Controller
{

    function __construct()
    {
        parent::__construct();


        if ($this->input->cookie('language') != "") {
            $language = $this->input->cookie('language');
        } else {
            if (!empty($core_settings->language)) {
                $language = $core_settings->language;
            } else {
                $language = "english";
            }
        }
        $this->lang->load('quotation', $language);

        if ($this->client) {
            redirect('cprojects');
        } elseif ($this->user) {

        } else {
            //redirect('quotation/');
        }
        $this->view_data['submenu'] = array(
            $this->lang->line('application_quotation') => 'Quotation'
        );

    }

    function index()
    {
        if ($_POST) {
            unset($_POST['send']);
            $_POST = array_map('htmlspecialchars', $_POST);
            $_POST['status'] = "New";
            $_POST['date'] = date("Y-m-d H:i", time());
            $item = Quote::create($_POST);
            if (!$item) {
                $this->session->set_flashdata('message', 'error:' . $this->lang->line('quotation_create_error'));
            } else {
                $this->load->helper('notification');
                $this->session->set_flashdata('message', 'success:' . $this->lang->line('quotation_create_success'));
                $admins = User::find('all', array('conditions' => array('admin = ? AND status = ?', '1', 'active')));
                foreach ($admins as &$value):
                    send_notification($value->email, $this->lang->line('application_notification_quotation_subject'), $this->lang->line('application_notification_quotation'));
                endforeach;
            }
            redirect('quotation');

        } else {
            $this->theme_view = 'fullpage';
            $this->view_data['form_action'] = 'quotation';
            $this->content_view = 'quotation/_main';
        }
    }

    function qid($id = FALSE)
    {
        if ($_POST) {
            unset($_POST['send']);
            $_POST = array_map('htmlspecialchars', $_POST);
            $tfields = explode("||", $_POST["tfields"]);
            unset($_POST['tfields']);
            $counter = 0;
            $form = "";
            foreach ($_POST as $key => $value) {
                if ($key != "captcha" && $key != "confirmcaptcha") {
                    $form .= "<b>" . $tfields[$counter] . "</b>";

                    $form .= "<br>" . $value . "<br><br>";

                    $counter = $counter + 1;
                }
            }

            $attributes = array('form' => $form, 'status' => 'New', 'custom_quotation_id' => $id, 'date' => date("Y-m-d H:i", time()));
            $item = Quoterequest::create($attributes);
            if (!$item) {
                $this->session->set_flashdata('message', 'error:' . $this->lang->line('quotation_create_error'));
            } else {
                $this->load->helper('notification');
                $this->session->set_flashdata('message', 'success:' . $this->lang->line('quotation_create_success'));
                $admins = User::find('all', array('conditions' => array('admin = ? AND status = ?', '1', 'active')));
                foreach ($admins as &$value):
                    send_notification($value->email, $this->lang->line('application_notification_quotation_subject'), $this->lang->line('application_notification_quotation'));
                endforeach;
            }
            redirect('quotation/qid/' . $id);

        } else {
            $this->theme_view = 'fullpage';
            $this->view_data['quotation'] = Customquote::find_by_id($id);
            $this->view_data['form_action'] = 'quotation/qid/' . $id;

            $json_output = json_decode($this->view_data['quotation']->formcontent);
            $html_fields = "";
            $i = 0;

            foreach ($json_output->fields as $field) {
                $i = $i++;
                $required = '';

                switch ($field->field_type) {

                    case 'text':

                        if ($field->required == true) {
                            $required = 'required';
                        }
                        $html_fields .= '<div class="form-control">';
                        $html_fields .= '<label class="control-label">' . $field->label . '</label>';
                        $html_fields .= '<input type="text" name="' . $field->cid . '" class="' . $required . '">';
                        if (isset($field->field_options->description)) {
                            $html_fields .= '<p>' . $field->field_options->description . '</p>';
                        }
                        $html_fields .= '</div>';

                        break;


                    case 'email':

                        if ($field->required == true) {
                            $required = 'required';
                        }
                        $html_fields .= '<div class="form-control">';
                        $html_fields .= '<label class="control-label">' . $field->label . '</label>';
                        $html_fields .= '<input type="text" name="' . $field->cid . '" class="email ' . $required . '">';
                        if (isset($field->field_options->description)) {
                            $html_fields .= '<p>' . $field->field_options->description . '</p>';
                        }
                        $html_fields .= '</div>';

                        break;


                    case 'paragraph':

                        if ($field->required == true) {
                            $required = 'required';
                        }
                        $html_fields .= '<div class="form-control">';
                        $html_fields .= '<label class="control-label">' . $field->label . '</label>';
                        $html_fields .= '<textarea name="' . $field->cid . '" class="' . $required . '"></textarea>';
                        if (isset($field->field_options->description)) {
                            $html_fields .= '<p>' . $field->field_options->description . '</p>';
                        }
                        $html_fields .= '</div>';

                        break;

                    case 'section_break':
                        $html_fields .= '<div class="form-control">';
                        $html_fields .= '<label class="control-label">' . $field->label . '</label>';
                        $html_fields .= '<hr>';
                        if (isset($field->field_options->description)) {
                            $html_fields .= '<p>' . $field->field_options->description . '</p>';
                        }
                        $html_fields .= '</div>';

                        break;


                    case 'radio':

                        if ($field->required == true) {
                            $required = 'required';
                        }

                        $html_fields .= '<div class="form-control">';
                        $html_fields .= '<label class="control-label">' . $field->label . '</label>';

                        foreach ($field->field_options->options as $value) {
                            $html_fields .= '<input type="radio" name="' . $field->cid . '" value="' . $value->label . '"/> ' . $value->label . '<br>';
                        }
                        if (isset($field->description)) {
                            $html_fields .= '<p>' . $field->description . '</p>';
                        }
                        $html_fields .= '</div>';

                        break;

                    case 'checkboxes':

                        if ($field->required == true) {
                            $required = 'required';
                        }

                        $html_fields .= '<div class="form-control">';
                        $html_fields .= '<label class="control-label">' . $field->label . '</label>';

                        foreach ($field->field_options->options as $value) {
                            $checked = '';
                            if ($value->checked == true) {
                                $checked = 'checked="checked"';
                            }
                            $html_fields .= '<div class="margin-bottom-10"><input type="checkbox" name="' . $field->cid . '" value="' . $value->label . '" ' . $checked . ' /> ' . $value->label . '</div>';

                        }
                        if (isset($field->description)) {
                            $html_fields .= '<p>' . $field->description . '</p>';
                        }
                        $html_fields .= '</div>';

                        break;


                    case 'dropdown':

                        if ($field->required == true) {
                            $required = 'required';
                        }

                        $html_fields .= '<div class="form-control">';
                        $html_fields .= '<label class="control-label">' . $field->label . '</label>';
                        $html_fields .= '<select width="210px" name="' . $field->cid . '">';
                        foreach ($field->field_options->options as $value) {
                            $html_fields .= '<option>' . $value->label . '</option><br>';
                        }
                        $html_fields .= '</select>';
                        if (isset($field->description)) {
                            $html_fields .= '<p>' . $field->description . '</p>';
                        }
                        $html_fields .= '</div>';

                        break;

                }
                $html_fields .= "<br/>";

            }

            $number1 = rand(1, 10);
            $number2 = rand(1, 10);

            $captcha = $number1 + $number2;

            //captcha
            $html_fields .= '<input type="hidden" id="captcha" name="captcha" value="' . $captcha . '"><div class="form-control">';
            $html_fields .= '<label class="control-label-e">' . $number1 . '+' . $number2 . ' = ?</label>';
            $html_fields .= '<input type="text" id="confirmcaptch" name="confirmcaptcha" equalto="#captcha" class="' . $required . '"></div>';
            $this->view_data['fields'] = $html_fields;


            $this->content_view = 'quotation/_custom';
        }
    }


    function language($lang = false)
    {
        $folder = 'application/language/';
        $languagefiles = scandir($folder);
        if (in_array($lang, $languagefiles)) {
            $cookie = array(
                'name' => 'language',
                'value' => $lang,
                'expire' => '31536000',
            );

            $this->input->set_cookie($cookie);
        }
        redirect('quotation');
    }


}