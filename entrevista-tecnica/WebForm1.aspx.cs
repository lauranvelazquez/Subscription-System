using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace entrevista_tecnica
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DivData.Visible = false;
            ButtonCancel.Visible = false;
            ButtonModify.Visible = false;
            ButtonNew.Visible = false;
            ButtonRegister.Visible = false;
            ButtonRegisterSusc.Visible = false;
            ButtonSave.Visible = false;

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            var vm = new ValidateFunctions();
             if (vm.ValidateSearch(DropDownListTypeDni.SelectedValue, TextBoxDni.Text)) {
                String documentType = DropDownListTypeDni.SelectedValue.ToString();
                String document = TextBoxDni.Text;
                var sentence = "SELECT * FROM Suscriptor WHERE NumeroDocumento like (@document) AND TipoDocumento like (@documentType)";

                var connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\usuario\source\repos\entrevista-tecnica\entrevista-tecnica\App_Data\Database1.mdf;Integrated Security=True");
                connection.Open();

                var comand = new SqlCommand(sentence, connection);
                comand.Parameters.AddWithValue("document", document);
                comand.Parameters.AddWithValue("documentType", documentType);

                SqlDataReader reader = comand.ExecuteReader();

                if (reader.Read())
                {
                    TextBoxName.Text = Convert.ToString(reader["Nombre"]);
                    TextBoxLastName.Text = Convert.ToString(reader["Apellido"]);
                    TextBoxDni.Text = Convert.ToString(reader["NumeroDocumento"]);
                    DropDownListTypeDni.SelectedValue = Convert.ToString(reader["TipoDocumento"]);
                    TextBoxAddress.Text = Convert.ToString(reader["Direccion"]);
                    TextBoxTelephone.Text = Convert.ToString(reader["Telefono"]);
                    TextBoxEmail.Text = Convert.ToString(reader["Email"]);
                    TextBoxUsername.Text = Convert.ToString(reader["NombreUsuario"]);
                    TextBoxPass.Text = Convert.ToString(reader["Password"]);
                    currentId = (int)Convert.ToInt64(reader["IdSuscriptor"]);
                    TextBoxEstado.Text = "Registrado";

                    Results.Text = "Suscriptor encontrado";
                    DivData.Visible = true;
                    ButtonModify.Visible = true;
                    ButtonNew.Visible = true;
                    ButtonCancel.Visible = true;
                    ButtonRegisterSusc.Visible = true;
                }
                else
                {
                    Results.Text = "No se encontró el suscriptor ¿Desea darlo de alta?";
                    ButtonRegister.Visible = true;
                    ButtonCancel.Visible = true;
                }

                connection.Close();
            }
            else
            {
                Results.Text = "Error. Por favor completar todos los campos.";
            }   
        }


        protected void ButtonRegisterSusc_Click(object sender, EventArgs e)
        {
            var connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\usuario\source\repos\entrevista-tecnica\entrevista-tecnica\App_Data\Database1.mdf;Integrated Security=True");
            connection.Open();

            var sentence1 = "SELECT * FROM Suscripcion AS r JOIN Suscriptor AS s ON s.IdSuscriptor = r.IdSuscriptor WHERE s.NumeroDocumento = (@document)";
            var command1 = new SqlCommand(sentence1, connection);

            command1.Parameters.AddWithValue("document", TextBoxDni.Text);

            SqlDataReader reader = command1.ExecuteReader();

            if (reader.Read())
            {
                Results.Text = "El suscriptor ya tiene una suscripción vigente.";
            }
            else
            {
                var sentence2 = "INSERT INTO Suscripcion (IdSuscriptor, FechaAlta, FechaFin, MotivoFin) values (@idSuscriptor, @fechaAlta, @fechaFin, @motivoFin)";
                var command2 = new SqlCommand(sentence2, connection);
                command2.Parameters.AddWithValue("IdSuscriptor", currentId);
                command2.Parameters.AddWithValue("fechaAlta", DateTime.Now);
                command2.Parameters.AddWithValue("fechaFin", null);
                command2.Parameters.AddWithValue("motivoFin", null);

                try
                {
                    command2.ExecuteNonQuery();
                    Results.Text = "Se ha registrado la suscripcion.";
                }
                catch
                {
                    Results.Text = "Error. No se ha podido registrar la suscripción.";
                }
            }
            connection.Close();
        }


        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Results.Text = "Su suscripción fue cancelada correctamente.";
        }


        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            var vm = new ValidateFunctions();
            if (vm.ValidateForm(TextBoxName.Text, TextBoxLastName.Text, TextBoxAddress.Text, TextBoxTelephone.Text, TextBoxEmail.Text, TextBoxUsername.Text, TextBoxPass.Text))
            {
                var sentence = "INSERT INTO Suscriptor (Nombre, Apellido, NumeroDocumento, TipoDocumento, Direccion, Telefono, Email, NombreUsuario, Password) values (@name, @lname, @document, @typeDoc, @address, @phone, @email, @user, @pass)";
                var conexion = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\usuario\source\repos\entrevista-tecnica\entrevista-tecnica\App_Data\Database1.mdf;Integrated Security=True");
            
                conexion.Open();
                var comando = new SqlCommand(sentence, conexion);

                comando.Parameters.AddWithValue("name", TextBoxName.Text);
                comando.Parameters.AddWithValue("lname", TextBoxLastName.Text);
                comando.Parameters.AddWithValue("document", TextBoxDni.Text);
                comando.Parameters.AddWithValue("typeDoc", DropDownListTypeDni.SelectedValue);
                comando.Parameters.AddWithValue("address", TextBoxAddress.Text);
                comando.Parameters.AddWithValue("phone", TextBoxTelephone.Text);
                comando.Parameters.AddWithValue("email", TextBoxEmail.Text);
                comando.Parameters.AddWithValue("user", TextBoxUsername.Text);
                comando.Parameters.AddWithValue("pass", TextBoxPass.Text);

                try
                {
                    comando.ExecuteNonQuery();
                    Results.Text = "El nuevo suscriptor " + TextBoxUsername.Text + " con contraseña "+ TextBoxPass.Text +" ha sido cargado correctamente";
                }
                catch
                {
                    Results.Text = "Error. No se pudo cargar al suscriptor.";
                }

                conexion.Close();
            }
            else
            {
                Results.Text = "Error. Debe ingresar todos los campos para continuar.";
            }
            

        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            Results.Text = "Complete todos los campos: ";

            TextBoxName.Text = null;
            TextBoxLastName.Text = null;
            TextBoxAddress.Text = null;
            TextBoxTelephone.Text = null;
            TextBoxEmail.Text = null;
            TextBoxUsername.Text = null;
            TextBoxPass.Text = null;

            TextBoxEstado.Text = "No Registrado";

            DivData.Visible = true;
            ButtonSave.Visible = true;
            ButtonCancel.Visible = true;
            ButtonRegisterSusc.Visible = true;
        }

        protected void ButtonNew_Click(object sender, EventArgs e)
        {
            TextBoxName.Text = null;
            TextBoxLastName.Text = null;
            TextBoxDni.Text = null;
            DropDownListTypeDni.SelectedValue = null;
            TextBoxAddress.Text = null;
            TextBoxTelephone.Text = null;
            TextBoxEmail.Text = null;
            TextBoxUsername.Text = null;
            TextBoxPass.Text = null;

            TextBoxEstado.Text = "No Registrado";

            DivData.Visible = false;

            Results.Text = " ";
        }


        protected void ButtonModify_Click(object sender, EventArgs e)
        {
            var vm = new ValidateFunctions();
            if (vm.ValidateForm(TextBoxName.Text, TextBoxLastName.Text, TextBoxAddress.Text, TextBoxTelephone.Text, TextBoxEmail.Text, TextBoxUsername.Text, TextBoxPass.Text))
            {
                var conexion2 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\usuario\source\repos\entrevista-tecnica\entrevista-tecnica\App_Data\Database1.mdf;Integrated Security=True");
                conexion2.Open();

                var sentence = "UPDATE Suscriptor SET Nombre=(@name), Apellido=(@lname), TipoDocumento=(@typeDoc), Direccion=(@address), Telefono=(@phone), Email=(@email), NombreUsuario=(@user), Password=(@pass) WHERE NumeroDocumento = (@document)";
                var comando2 = new SqlCommand(sentence, conexion2);

                comando2.Parameters.AddWithValue("document", TextBoxDni.Text);
                comando2.Parameters.AddWithValue("name", TextBoxName.Text);
                comando2.Parameters.AddWithValue("lname", TextBoxLastName.Text);
                comando2.Parameters.AddWithValue("typeDoc", DropDownListTypeDni.SelectedValue);
                comando2.Parameters.AddWithValue("address", TextBoxAddress.Text);
                comando2.Parameters.AddWithValue("phone", TextBoxTelephone.Text);
                comando2.Parameters.AddWithValue("email", TextBoxEmail.Text);
                comando2.Parameters.AddWithValue("user", TextBoxUsername.Text);
                comando2.Parameters.AddWithValue("pass", TextBoxPass.Text);

                try
                {
                    comando2.ExecuteNonQuery();
                    Results.Text = "Suscriptor Modificado";
                }
                catch
                {
                    Results.Text = "Error. El suscriptor no pudo ser modificado";
                }

                conexion2.Close();
            }
            else
            {
                Results.Text = "Error. Debe ingresar todos los campos para continuar.";
            }


        }
        public int currentId = 0;
    }


}