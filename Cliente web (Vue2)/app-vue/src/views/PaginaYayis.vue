<template>
    <v-container>
        <!-- Panel de búsqueda -->
        <v-row>
            <v-card elevation="2" width="100%" dense class="ml-5 mr-5">
                <v-card-title>Búsqueda</v-card-title> <!-- Título de la card -->
                <v-card-text>
                    <v-form ref="formBusqueda" v-model="valid">
                        <v-row>
                           <v-col cols="12" md="4" sm="6">
                                <v-text-field 
                                v-model="filtro.numPersonal"
                                label="NOP"
                                type="number"
                                min="0"
                                max="10"
                                required
                                /> 
                           </v-col>
                           <v-col cols="12" md="4" sm="6">
                                <v-text-field 
                                v-model="filtro.nombre"
                                label="Nombre"
                                maxlength="10"
                                counter
                                /> 
                           </v-col>
                           <v-col cols="12" md="4" sm="6">
                                <v-text-field 
                                v-model="filtro.apellidoPaterno"
                                label="Apellido Paterno"
                                /> 
                           </v-col>
                        </v-row>
                    </v-form>
                </v-card-text> <!-- Texto de la card -->
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn rounded color="blue darken-4" dark small @click="onClickBuscar"><v-icon dark left> mdi-magnify </v-icon> Buscar</v-btn>
                    <v-btn rounded color="orange" dark small @click="onClickLimpiar"> <v-icon dark left> mdi-backspace </v-icon> Limpiar</v-btn>
                </v-card-actions> <!-- Acciones para botones de la card -->
            </v-card>
        </v-row>
        <!-- Sección tabla maestro/principal -->
        <v-row align="start" justify="start">
            <!-- Botones tabla -->
            <v-col cols="1">
                <v-btn rounded color="blue darken-4" dark small @click="onClickNuevoPersonal"><v-icon dark left> mdi-plus </v-icon> Nuevo personal</v-btn>
            </v-col>
        </v-row>
        <v-row>
            <v-col cols="12">
                <!-- headers en la tabla arreglo (encabezados) -->
                <!-- items datos que llenan la tabla, arreglo -->
                    <v-data-table
                        :headers="encabezados"
                        :items="datos"
                        :items-per-page="5"
                        class="ml-5 mr-5"
                        dense
                        item-key="idPersonal"
                        single select
                        @click:row="onClickFila"
                    >
                <template v-slot:item.acciones="{ item }">
                    <v-row>
                        <v-tooltip bottom>
                        <template v-slot:activator="{ on, attrs }">
                            <v-btn icon v-bind="attrs" @click="onClickEditarPersonal(item)">
                                <v-icon color="blue darken-4" v-on="on">mdi-pencil</v-icon>
                            </v-btn>
                        </template>
                        <span>Editar</span>
                    </v-tooltip>
                    <v-tooltip bottom>
                        <template v-slot:activator="{ on, attrs }">
                            <v-btn icon v-bind="attrs" @click="onClickEliminarPersonal(item)">
                                <v-icon color="red" v-on="on">mdi-delete-empty</v-icon>
                            </v-btn>
                        </template>
                        <span>Eliminar</span>
                    </v-tooltip>
                    </v-row>  
                </template>
                <template v-slot:item.idPersonal="{ item }">
                    <span class="font-weight-bold blue--text">
                        {{ item.idPersonal }}
                    </span>
                </template>
                </v-data-table>
            </v-col>
        </v-row>
        <!-- SECCIÓN DETALLE -->
        <v-row></v-row>
        <v-dialog
        v-model="dialogoPersonal"
        persistent
        max-width="1000"
        transition="dialog-transition"
        >
            <v-card>
                <v-card-title>Nuevo Personal</v-card-title>
                <v-card-text>
                    <v-form ref="formPersonal" v-model="valid">
                        <v-row align="center" justify="start">
                            <v-col cols="12" md="6" sm="4">
                                <v-text-field v-model="personal.nombre" label="Nombre"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="6" sm="4">
                                <v-text-field v-model="personal.apellidoPaterno" label="Apellido Paterno"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="6" sm="4">
                                <v-text-field v-model="personal.apellidoMaterno" label="Apellido Materno"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="6" sm="4">
                                <v-text-field v-model="personal.rfc" label="RFC"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="6" sm="4">
                                <v-text-field v-model="personal.curp" label="CURP"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="6" sm="4">
                                <v-select
                                 :items="catPaises" 
                                 label="Pais"
                                 item-value="id"
                                 item-text="nombre"
                                 @change="changePais"
                                 ></v-select>
                            </v-col>
                            <v-col cols="12" md="6" sm="4">
                                <v-select
                                 :items="catEstados" 
                                 label="Estados"
                                 item-value="id"
                                 item-text="nombre"
                                 @change="changeEstado"
                                 ></v-select>
                            </v-col>
                        </v-row>
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-spacer/>
                    <v-btn
                    elevation="0"
                    dark
                    rounded
                    width="120"
                    class="green px13 font-weight-regular pr-4"
                    small
                    @click="onClickGuardarPersonal"
                    >
                    <v-icon left> mdi-check</v-icon> Guardar
                    </v-btn>
                    <v-btn
                    elevation="0"
                    rounded
                    text
                    width="100"
                    class="red--text px13 font-weight-bold"
                    small
                    @click="onClickCerrarPersonal"
                    >
                    <v-icon left> mdi-close-thick</v-icon> Cerrar
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-container>
</template>

<script>
import {get, post} from "../api/Requests";
export default {
    name: "PaginaYayis",
    props: {},
    data() {
        return {
            valid:false,
            filtro:{
                numPersonal:null,
                nombre:null,
                apellidoPaterno:null,
            },
            encabezados:[
                {
                    text:'Acciones',
                    value:'acciones',
                    sortable:false,
                    width:70
                },
                {
                    text: "NDP",
                    value: 'idPersonal',
                    align: 'start',
                    sortable: true,
                    width:130
                },
                {
                    text: "Nombre",
                    value: 'nombre',
                    align: 'start',
                    sortable: true,
                    width:130
                },
                {
                    text: "Apellido Paterno",
                    value: 'apellidoPaterno',
                    align: 'start',
                    sortable: true,
                    width:130
                },
                {
                    text: "Apellido Materno",
                    value: 'apellidoMaterno',
                    align: 'start',
                    sortable: true,
                    width:130
                },
                {
                    text: "CURP",
                    value: 'curp',
                    align: 'start',
                    sortable: true,
                    width:130
                },
                {
                    text: "RFC",
                    value: 'rfc',
                    align: 'start',
                    sortable: true,
                    width:130
                },
                {
                    text: "Fecha Nacimiento",
                    value: 'fechaNacimiento',
                    align: 'start',
                    sortable: true,
                    width:130
                },
                {
                    text: "Sexo",
                    value: 'sexo',
                    align: 'start',
                    sortable: true,
                    width:130
                },
            ],
            datos:[
                {
                    idPersonal:'4673',
                    sexo:'F',
                    fechaNacimiento:'29/06/2000',
                    rfc:'YAL02329LZ',
                    curp:'LOAI000629MVZPGNA1',
                    apellidoPaterno:'López',
                    apellidoMaterno:'Aguilar',
                    nombre:'Ingrid Yadelí',
                },
                {
                    idPersonal:'3312',
                    sexo:'M',
                    fechaNacimiento:'18/04/1997',
                    rfc:'MR0G39015T',
                    curp:'ROGM970418HVPGATV3',
                    apellidoPaterno:'Rodríguez',
                    apellidoMaterno:'Gómez',
                    nombre:'Marco',
                }
            ],
            dialogoPersonal: false,
            personal:{
                idPersonal:null,
                nombre:null,
                apellidoPaterno:null,
                apellidoMaterno:null,
                rfc:null,
                curp:null,
                sexo:null,
                fechaNacimiento:null,
            },
            catPaises:[
                {id:1, nombre:'México'},
                {id:23, nombre:'Brasil'},
                {id:31, nombre:'Argentina'},
                {id:98, nombre:'Colombia'},
            ],
            catEstados:[],
            idPersonalSelect:null,
        };
    },
    created() {
        //verificar con un if que tengamos una sesion iniciada y que exista un usuario, de lo contrario nos
        //regresará al login.
        if(!this.$session.id() && !this.$session.has("user")){
            this.$router.push({name:"Login"});
        }
    },
    mounted() {},
    computed: {},
    watch: {},
    methods: {
        async getPersonal(){
            /*if(this.filtro.numPersonal === null){
                this.filtro.numPersonal = 0;
            }*/
            const response = await get("/personal/getPersonalByIdPersonal");
            if(response.error == true){
                console.log(error);
                /*this.$toast.error(response.mensaje, {
                    position: "top-right",
                    duracion: "3000",
                });*/
                return;
            }else{
                this.datos = response;
            }
        },
        async getInformacionLaboral(idPersonal){

        },
        onClickFila(item,row){
            row.select(true);
            //this.idPersonalSelect=row.item.idPersonal;
            this.idPersonalSelect=item.idPersonal;
            this.getInformacionLaboral(this.idPersonalSelect);
        },
        onClickBuscar(){
            this.getPersonal();
        },
        onClickLimpiar(){
            /* Hacemos referencia a todos los refs del formulario formBusqueda y el método reset borrará lo que contenga */
            this.$refs.formBusqueda.reset();
        },
        onClickNuevoPersonal(){
            this.dialogoPersonal = true;
        },
        onClickEditarPersonal(item){
            this.personal={...item}; /* primero se carga la información y luego el dialogo porque sino no cargará*/
            this.dialogoPersonal=true;
        },
        onClickEliminarPersonal(item){
            console.log(item)
        },
        onClickGuardarPersonal(){

        },
        onClickCerrarPersonal(){
            this.$refs.formPersonal.reset();
            this.dialogoPersonal = false;
        },
        changePais(value){
            console.log(value);
            if(value===1){
                this.catEstados=[
                    {id:1, nombre:'Veracruz'},
                    {id:2, nombre:'Colima'},
                    {id:3, nombre:'Tampico'},
                    {id:4, nombre:'Puebla'},
                ]
            }
            if(value===23){
                this.catEstados=[
                    {id:1, nombre:'Rio de Janeiro'},
                    {id:2, nombre:'Sao Paulo'},
                    {id:3, nombre:'Otro'},
                    {id:4, nombre:'Otro x2'},
                ]
            }
        }
    },
};
</script>

<style></style>