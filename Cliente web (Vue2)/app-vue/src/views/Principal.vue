<template>
    <div>
    <span>{{ msj }}</span>
    <button @click="mensajeReverso">Mensaje reverso</button>
    <!-- O
    <button @:click="">Mensaje reverso</button> -->
    </div>
</template>

<script>
export default {
    name: "Principal",
    props: {},
    data() {
        return {
            msj:"Hola soy la página principal"
            //Cómo asociar el mensaje a la siguiente vista? usamos llaves. 
            //Notación mostacho para hacer una liga entre la vista y el código (ver dentro de span)
        };
    },
    created() {
        //verificar con un if que tengamos una sesion iniciada y que exista un usuario, de lo contrario nos
        //regresará al login.
        if(!this.$session.id() && !this.$session.has("user")){
            this.$router.push({name:"Login"});
        }else{

        }
        console.log("Creado..");
    },
    mounted() {
        console.log("Integrado..");
    },
    computed: {},
    watch: {},
    methods: {
        mensajeReverso(){
            console.log("Hola :D");
            this.msj = this.msj.split("").reverse().join("");
        }
    },
};
</script>

<style></style>