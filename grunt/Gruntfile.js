module.exports = function(grunt) {

   grunt.initConfig({
      pkg: grunt.file.readJSON('package.json'),
      clean: {
         files: ['']
      },
      uglify: {
         options: {
            mangle: true,
            compress: true
         },
         main: {
            files: {
               '': ['']
            }
         },
         player: {
            files: {
               '': ['']
            }
         },
         lib: {
            files: {
               '': ['']
            }
         }
      },
      cssmin: {
         options: {
            noAdvanced: true
         },
         main: {
            files: {
               '': ['']
            }
         }
      },
      jshint: {
         all: [''],
         options: {
            jshintrc: '.jshintrc'
         }
      },
      concurrent: {
         dev: {
            tasks: ['nodemon', 'watch'],
            options: {
               logConcurrentOutput: true
            }
         }
      },
      watch: {
         dist: {
            files: [''],
            tasks: ['clean', 'uglify', 'cssmin'],
            options: {
               livreload: true
            }
         }
      },
      nodemon: {
         dev: {
            script: 'server.js',
            options: {
               nodeArgs: ['--debug'],
               ext: 'dust,js,css',
               delayTime: 1000,
               callback: function(nodemon) {

                  nodemon.on('config:update', function() {
                 /*    setTimeout(function() {
                        require('child_process').exec('firefox http://localhost:3000');
                     }, 1000);*/
                  });

                  nodemon.on('restart', function() {

                  });
               }
            },
         }
      }
   });

   grunt.loadNpmTasks('grunt-contrib-jshint');
   grunt.loadNpmTasks('grunt-contrib-uglify');
   grunt.loadNpmTasks('grunt-contrib-clean');
   grunt.loadNpmTasks('grunt-contrib-cssmin');
   grunt.loadNpmTasks('grunt-contrib-watch');
   grunt.loadNpmTasks('grunt-concurrent');
   grunt.loadNpmTasks('grunt-nodemon');

   grunt.registerTask('check', ['jshint']);
   grunt.registerTask('init', ['clean', 'uglify', 'cssmin']);
   grunt.registerTask('default', ['clean', 'uglify', 'cssmin', 'concurrent']);
}
