import React from 'react';
import Grid from '@material-ui/core/Grid';


const TabActionForm = (props) => {
    const { textFields, addButton, deleteButton} = props;


    let fields = textFields.map(field =>
        <Grid item>
            {field}
        </Grid>
    );


    

    return (
        <div style={{padding: '1%'}}>
            <Grid container justify="center" spacing={6}>
                {fields}
            </Grid>
            <Grid container justify="center" spacing={6}>
                <Grid item>
                    {addButton}
                </Grid>
                <Grid item>
                    {deleteButton}
                </Grid>
            </Grid>
        </div>
    );
}

export default TabActionForm