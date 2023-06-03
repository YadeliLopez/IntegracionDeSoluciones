<template>
    <v-container fluid>
        <v-row align="center" justify="center">
            <v-col cols="12" sm="6" md="6" lg="6" xl="6">
              <v-img :src="require('../assets/logo.png')"></v-img>  
        </v-col>
        <v-col cols="12" sm="6" md="6">
            <v-card class="card">
     
                    <v-card-title style="text-align: center; display: block !important;">Inicio de sesión
                    </v-card-title>

                <v-card-text>
                    <v-form ref="formSesion" v-model="valid" lazy-validation>
                    <v-row aling="center" justify="center">
                        <v-col cols="11" sm="10" md="4">
                            <v-text-field  label="Usuario" v-model="usuario.usuario" :rules="required"></v-text-field>
                        </v-col>
                    </v-row>
                    <v-row aling="center" justify="center">
                        <v-col cols="11" sm="10" md="4">
                            <v-text-field type="password" label="Contraseña" v-model="usuario.contrasena" :rules="required"></v-text-field>
                        </v-col>
                    </v-row>
                </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-row aling="center" justify="center">
                        <v-btn @click="onClickInicioSesion">Iniciar sesión</v-btn>
                    </v-row>
                    
                </v-card-actions>

            </v-card>
        </v-col>
        </v-row>
        
        
      </v-container>
  
  </template>
  <script>

  import {get, post} from '../api/Requests.js'

  export default {
    name: "login",
    components:{},
    props:{},
    data(){
      return{    
        valid:false,  
        loader:false,
        usuario:{
          usuario:null,
          contrasena:null,
        },  
        required:[(v) => !!v || "Este campo se requiere para iniciar sesión"],         
      };
    },
    created(){},
    mounted(){},
    computed:{},
    watch:{},
    methods:{
        
      async login(){
        //this.loader = true;
        const response = await post("/sesion/login/",this.usuario);
        //this.loader = false;
        if(response.error === true){
            console.log(response);
            return;
        }else{
            console.log(response);
            this.$session.start();
            this.$session.set("usuario", JSON.parse(response.respuesta));
            this.$router.push({name:"principal"});
        }
 

      },
      onClickInicioSesion(){
            if(this.$refs.formSesion.validate()){
                this.login()
            }
        }
    },
  };
  </script>
  
  <style></style>