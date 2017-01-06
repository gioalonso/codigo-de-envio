// desifrado de contrasenia del comprimido zip Fuerza Bruta
// Alonso Arroyo Giovanni

#include <iostream>
#include <cstdlib>

using namespace std;

int main()
{
    string dir = " \"C:\\Fuerza Bruta\\comprimido.zip\" ";
    string command = "unzip -o -P ";
    string password;
    string w,x,y,z;
    int i,j,k,l;
    char letras[26]={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};

    for(i=26;i>0;i--)
    {
        for(j=26;j>0;j--)
        {
            for(k=26;k>0;k--)
            {
                for(l=26;l>0;l--)
                {
                    w=letras[i];
                    x=letras[j];
                    y=letras[k];
                    z=letras[l];
                    password=w+x+y+z;
                    string linea = command + password + dir;
                    int s = system(linea.c_str());
                    if ( s == 0 )
                    {
                        cout << endl << "Se descomprimio el archivo" <<endl;
                        cout <<"El pass es: " <<password <<endl;
                        return 0;
                    }
                }
                l=0;
            }
            k=0;
        }
        j=0;
    }

}
