module.exports = function(grunt) {
   grunt.initConfig({
      pkg: grunt.file.readJSON('package.json'),
      clean: {
         files: ['']
      },
      concat: {
         options: {
         },
         dist: {
            src: [''],
            dest: 'concatenatedFiles.js'
         }
      },
      uglify: {
         options: {
            banner: ''
         },
         main: {
            files: {
               'main.min.js': ['fileOne.js', 'fileTwo.js']
            }
         },
      },
      cssmin: {
         options: {
         
         },
         main: {
            files: {
               'main.min.css': ['fileOne.css', 'fileTwo.css']
            }
         }
      },
      jshint: {
         all: ['config/**/*.js', 'app/**/*.js', 'public/js/*.js'],
         options: {
            jshintrc: '.jshintrc'
         }
      },
      nodemon: {
         dev: {
            script: 'server.js',
            options: {
               nodeArgs: ['--debug'],
               delayTime: 1000,
               callback: function(nodemon) {

                  // launch in firefox 
                  nodemon.on('config:update', function() {
                     setTimeout(function() {
                        require('child_process').exec('firefox http://localhost:8055');
                     }, 1000);
                  });

                  nodemon.on('restart', function() {
                  // rebuild
                  });
               }
            },
         }
      }
   });

   grunt.loadNpmTasks('grunt-contrib-jshint');
   grunt.loadNpmTasks('grunt-contrib-concat');
   grunt.loadNpmTasks('grunt-contrib-uglify');
   grunt.loadNpmTasks('grunt-contrib-clean');
   grunt.loadNpmTasks('grunt-contrib-cssmin');
   grunt.loadNpmTasks('grunt-nodemon');
   grunt.loadNpmTasks('grunt-reload');

   grunt.registerTask('check', ['jshint']);
   grunt.registerTask('init', ['clean', 'uglify', 'cssmin']);
   grunt.registerTask('default', ['clean', 'uglify', 'cssmin', 'nodemon']);
}
