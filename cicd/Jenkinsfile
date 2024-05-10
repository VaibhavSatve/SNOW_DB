pipeline {
    agent any
    
    environment {
        // Define Snowflake credentials
        SNOWFLAKE_ACCOUNT = credentials('SF_ACCOUNT')
        SNOWFLAKE_USER = credentials('SF_USERNAME')
        SNOWFLAKE_PASSWORD = credentials('SNOWFLAKE_PASSWORD')
        SNOWFLAKE_WAREHOUSE = credentials('SF_WAREHOUSE')
        SNOWFLAKE_ROLE = credentials('SF_ROLE')
        SNOWFLAKE_DATABASE = credentials('SF_DATABASE')
        
        // Define Git credentials
        GIT_CREDENTIALS_ID = credentials('github_token')
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: GIT_CREDENTIALS_ID,
                    url: 'https://github.com/VaibhavSatve/SNOW_DB.git'
            }
        }
        
    stage('Deploy to Dev') {
        steps {
            script {                
                // Execute schemachange command
                sh "schemachange -f \$GITHUB_WORKSPACE/migrations -a ${SNOWFLAKE_ACCOUNT} -u ${SNOWFLAKE_USER} -r ${SNOWFLAKE_ROLE} -w ${SNOWFLAKE_WAREHOUSE} -d ${SNOWFLAKE_DATABASE} -c ${SNOWFLAKE_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
            }
        }
    }
    }
}
