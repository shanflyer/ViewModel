using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

//public class CustomMesh : Editor
//{
//    public Texture2D tex;
//    public Sprite sprite;
//    MeshRenderer render;
//    Mesh mesh;
//    public string name;


//    [MenuItem("Tool/ChangeMeshs")]
//    public static void ChangeMeshs()
//    {
//        for (int i = 0; i < Selection.gameObjects.Length; i++)
//        {
//            Transform target = Selection.gameObjects[i].transform;
//            Debug.Log($"{target.name}");
//            foreach (var item in target.GetComponentsInChildren<InitSpriteMesh>())
//            {
//                GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>($"Assets/Mesh/Plant/{item.gameObject.name}.prefab");
//                if (obj != null)
//                {
//                    GameObject Instance = PrefabUtility.InstantiatePrefab(obj) as GameObject;

//                    Instance.transform.parent = item.transform.parent;
//                    Instance.transform.position = item.transform.position;
//                    Instance.transform.rotation = item.transform.rotation;
//                    Instance.transform.localScale = item.transform.localScale;
//                    //Instance.transform.parent = item.transform.parent;

//                    DestroyImmediate(item.gameObject);
//                }
//            }
//            PrefabUtility.SaveAsPrefabAsset(target.gameObject, $"Assets/Resources/Prefabs/SceneItem/{target.name}.prefab");
//        }
//    }

//    [MenuItem("GameObject/ChangeMesh",false,-1)]
//    public static void ChangeMesh()
//    {
//        //Selection.gameObjects
//        Transform target = Selection.activeGameObject.transform;
//        Transform sprite = target.GetChild(0);
//        foreach (var item in sprite.GetComponentsInChildren<InitSpriteMesh>())
//        {
//            Debug.Log($"{item.gameObject.name}");
//            GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>($"Assets/Mesh/Object/{item.gameObject.name}.prefab");
//            if (obj != null)
//            {
//                GameObject Instance = PrefabUtility.InstantiatePrefab(obj) as GameObject;
                
//                Instance.transform.parent = item.transform.parent;
//                DestroyImmediate(item.gameObject);
//            }
//        }
//        PrefabUtility.SaveAsPrefabAsset(target.gameObject, $"Assets/Resources/Prefabs/SceneItem/{target.name}.prefab");
//    }

//    [MenuItem("Assets/MeshTool/CreateSpritePanel_Texture", true)]
//    public static bool ValidateCreateSpritePanel_Texture()
//    {
//        if (Selection.activeObject is Texture2D)
//            return true;
//        return false;
//    }

//    [MenuItem("Assets/MeshTool/CreateSpritePanel_Texture",false,0)]
//    static void CreateSpritePanel_Texture()
//    {
//        Texture2D texture = (Texture2D)Selection.activeObject;
//        Object[] objects = AssetDatabase.LoadAllAssetsAtPath(AssetDatabase.GetAssetPath(texture));

//        Directory.CreateDirectory("Assets/Resources/Mesh/" + texture.name);

//        Material mat;
//        if (!File.Exists($"Assets/Material/{texture.name}.mat"))
//        {
//            Shader shader = AssetDatabase.LoadAssetAtPath<Shader>("Assets/Shader/Other/SuperShader.shader");
//            mat = new Material(shader);
//            mat.name = texture.name;
//            mat.SetTexture("_MainTex", texture);

//            AssetDatabase.CreateAsset(mat, $"Assets/Material/{texture.name}.mat");
//        }
//        else
//        {
//            mat = AssetDatabase.LoadAssetAtPath<Material>($"Assets/Material/{texture.name}.mat");
//        }

//        for (int i = 0; i < objects.Length; i++)
//        {
//            Object o = objects[i];
//            Sprite sprite = o as Sprite;
//            if (sprite)
//            {
//                CreateSpritePanel(sprite, mat, texture.name);
//            }
//        }
//        AssetDatabase.Refresh();
//    }

//    [MenuItem("Assets/MeshTool/CreateSpritePanel_Sprite", true)]
//    public static bool ValidateCreateSpritePanel_Sprite()
//    {
//        if (Selection.activeObject is Sprite)
//            return true;
//        return false;
//    }

//    [MenuItem("Assets/MeshTool/CreateSpritePanel_Sprite", false, 0)]
//    static void CreateSpritePanel_Sprite()
//    {
//        Sprite sprite = (Sprite)Selection.activeObject;
//        Texture2D texture = sprite.texture;
//        string TexName = sprite.texture.name;

//        Directory.CreateDirectory("Assets/Resources/Mesh/" + texture.name);

//        Material mat;
//        if (!File.Exists($"Assets/Material/{texture.name}.mat"))
//        {
//            Shader shader = AssetDatabase.LoadAssetAtPath<Shader>("Assets/Shader/Other/SuperShader.shader");
//            mat = new Material(shader);
//            mat.name = texture.name;
//            mat.SetTexture("_MainTex", texture);

//            AssetDatabase.CreateAsset(mat, $"Assets/Material/{texture.name}.mat");
//        }
//        else
//        {
//            mat = AssetDatabase.LoadAssetAtPath<Material>($"Assets/Material/{texture.name}.mat");
//        }

//        if (sprite)
//        {
//            CreateSpritePanel(sprite, mat, texture.name);
//        }
//        AssetDatabase.Refresh();
//    }






//    static void CreateSpritePanel(Sprite sprite, Material mat,string texName)
//    {
//        GameObject gameObject = new GameObject("Ms_" + sprite.name);
//        if ((gameObject.GetComponent<MeshRenderer>()) == null)
//        {
//            gameObject.AddComponent<MeshRenderer>();
//        }
//        if (gameObject.GetComponent<MeshFilter>() == null)
//        {
//            gameObject.AddComponent<MeshFilter>();
//        }

//        Mesh mesh = new Mesh();
//        mesh.Clear();

//        Vector3[] vertices;
//        Vector2[] uv;
//        SetPanelVertivesUV(sprite,out vertices,out uv);//生成顶点和uv信息
//        mesh.vertices = vertices;
//        mesh.uv = uv;
//        mesh.triangles = SettPanelTriangles();//生成索引

//        mesh.RecalculateNormals();//重置法线
//        mesh.RecalculateBounds();   //重置范围

//        mesh.name = sprite.name;

//        gameObject.GetComponent<MeshFilter>().mesh = mesh;
//        gameObject.GetComponent<MeshRenderer>().material = mat;
//        gameObject.GetComponent<MeshRenderer>().sortingLayerName = "Unit";
//        gameObject.GetComponent<MeshRenderer>().sortingOrder = 0;

//        AssetDatabase.CreateAsset(mesh, "Assets/Resources/Mesh/" + texName + "/" + mesh.name + ".asset");
//        Object createObj = PrefabUtility.SaveAsPrefabAsset(gameObject, "Assets/Resources/Mesh/" + texName + "/" + sprite.name + ".prefab");
//        GameObject.DestroyImmediate(gameObject);
//    }

//    static void SetPanelVertivesUV(Sprite sprite,out Vector3[] vertices,out Vector2[] uv)
//    {
//        vertices = new Vector3[7];
//        uv = new Vector2[7];
//        Vector2 pivot = sprite.pivot / 100;
//        float width = sprite.rect.width / 100;
//        float hight = sprite.rect.height / 100;
//        Rect rect = sprite.rect;
//        rect.x /= sprite.texture.width;
//        rect.y /= sprite.texture.height;
//        rect.width /= sprite.texture.width;
//        rect.height /= sprite.texture.height;
//        for (int i = 0; i < 2; i++)
//        {
//            for (int j = 0; j < 2; j++)
//            {
//                vertices[i * 2 + j] = new Vector3(i * width - pivot.x , j * hight - pivot.y, 0);
//                uv[i * 2 + j] = new Vector2(rect.x + i * rect.width, rect.y + j * rect.height);
//            }
//        }
//        vertices[4] = new Vector3(-pivot.x, pivot.y - hight, 0);
//        vertices[5] = new Vector3(width - pivot.x, pivot.y - hight, 0);
//        vertices[6] = new Vector3(width -pivot.x, - pivot.y , 0);
//        uv[4] = new Vector2(rect.x, rect.y);
//        uv[5] = new Vector2(rect.x, rect.y);
//        uv[6] = new Vector2(rect.x, rect.y);
//    }

//    static private int[] SettPanelTriangles()
//    {
//        int[] triangles = new int[12];
//        triangles[0] = 0;
//        triangles[1] = 1;
//        triangles[2] = 3;
//        triangles[3] = 3;
//        triangles[4] = 2;
//        triangles[5] = 0;
//        triangles[6] = 0;
//        triangles[7] = 6;
//        triangles[8] = 4;
//        triangles[9] = 4;
//        triangles[10] = 6;
//        triangles[11] = 5;
//        return triangles;
//    }

//}
public class CustomMeshWindow : EditorWindow
{
    private static CustomMeshWindow window;//窗体实例

    public GameObject meshObj;

    string Path;

    bool spawnPafab = false;

    bool spawnMat = false;

    Texture2D tex;

    Sprite sprite;

    public enum Type
    {
        Texture,
        Sprint
    }
    Type type;

    //显示窗体
    [MenuItem("模型工具/自定义模型")]
    private static void ShowWindow()
    {
        window = GetWindow<CustomMeshWindow>();
        window.titleContent = new GUIContent("自定义模型");
        window.Show();
    }

    void OnSelectionChange()
    {
        if (Selection.activeObject is Texture2D)
        {
            type = Type.Texture;
            tex = (Texture2D)Selection.activeObject;
        }
        else if (Selection.activeObject is Sprite)
        {
            type = Type.Sprint;
            sprite = (Sprite)Selection.activeObject;
        }
    }


    private void OnGUI()
    {
        //绘制描述文本区域
        GUILayout.Space(10);
        type = (Type)EditorGUILayout.EnumPopup("资源类型", type);
        switch (type)
        {
            case Type.Texture:
                tex = EditorGUILayout.ObjectField(tex, typeof(Texture2D), false) as Texture2D;
                break;
            case Type.Sprint:
                sprite = EditorGUILayout.ObjectField(sprite, typeof(Sprite), false) as Sprite;
                break;
            default:
                break;
        }
        Path = EditorGUILayout.TextField("生成路径", Path);
        spawnPafab = EditorGUILayout.Toggle("生成预制体", spawnPafab);
        spawnMat = EditorGUILayout.Toggle("生成材质", spawnMat);

        if (GUILayout.Button("开始创建"))
        {
            switch (type)
            {
                case Type.Texture:
                    CreateSpritePanel_Texture(tex);
                    break;
                case Type.Sprint:
                    CreateSpritePanel_Sprite(sprite);
                    break;
                default:
                    break;
            }
        }
        GUILayout.Label("    模型、预制体生成在路径中\n    材质生成在\"Assets/Material/{图片名字}\"中\n    可选是否生成材质或预制体",
            GUILayout.MaxWidth(500), GUILayout.MaxHeight(60));

    }
    void CreateSpritePanel_Texture(Texture2D texture)
    {
        Object[] objects = AssetDatabase.LoadAllAssetsAtPath(AssetDatabase.GetAssetPath(texture));

        Directory.CreateDirectory(Path + "/" + texture.name);

        Material mat = null;
        if (spawnMat)
        {
            if (!File.Exists($"Assets/Material/{texture.name}.mat"))
            {
                Shader shader = AssetDatabase.LoadAssetAtPath<Shader>("Assets/Shader/Other/SuperShader.shader");
                mat = new Material(shader);
                mat.name = texture.name;
                mat.SetTexture("_MainTex", texture);

                AssetDatabase.CreateAsset(mat, $"Assets/Material/{texture.name}.mat");
            }
            else
            {
                mat = AssetDatabase.LoadAssetAtPath<Material>($"Assets/Material/{texture.name}.mat");
            }
        }

        for (int i = 0; i < objects.Length; i++)
        {
            Object o = objects[i];
            Sprite sprite = o as Sprite;
            if (sprite)
            {
                CreateSpritePanel(sprite, mat, texture.name);
            }
        }
        AssetDatabase.Refresh();
    }
    void CreateSpritePanel_Sprite(Sprite sprite)
    {
        Texture2D texture = sprite.texture;
        string TexName = sprite.texture.name;

        Directory.CreateDirectory(Path + "/" + texture.name);

        Material mat = null;
        if (spawnMat)
        {
            if (!File.Exists($"Assets/Material/{texture.name}.mat"))
            {
                Shader shader = AssetDatabase.LoadAssetAtPath<Shader>("Assets/Shader/Other/SuperShader.shader");
                mat = new Material(shader);
                mat.name = texture.name;
                mat.SetTexture("_MainTex", texture);

                AssetDatabase.CreateAsset(mat, $"Assets/Material/{texture.name}.mat");
            }
            else
            {
                mat = AssetDatabase.LoadAssetAtPath<Material>($"Assets/Material/{texture.name}.mat");
            }
        }

        if (sprite)
        {
            CreateSpritePanel(sprite, mat, texture.name);
        }
        AssetDatabase.Refresh();
    }

    void CreateSpritePanel(Sprite sprite, Material mat, string texName)
    {
        Mesh mesh = new Mesh();
        mesh.Clear();
        Vector3[] vertices;
        Vector2[] uv;
        SetPanelVertivesUV(sprite, out vertices, out uv);//生成顶点和uv信息
        mesh.vertices = vertices;
        mesh.uv = uv;
        mesh.triangles = SettPanelTriangles();//生成索引
        mesh.RecalculateNormals();//重置法线
        mesh.RecalculateBounds();   //重置范围
        mesh.name = sprite.name;

        AssetDatabase.CreateAsset(mesh, Path + "/" + texName + "/" + mesh.name + ".asset");

        if (spawnPafab)
        {
            GameObject gameObject = new GameObject("Ms_" + sprite.name);
            if ((gameObject.GetComponent<MeshRenderer>()) == null)
            {
                gameObject.AddComponent<MeshRenderer>();
            }
            if (gameObject.GetComponent<MeshFilter>() == null)
            {
                gameObject.AddComponent<MeshFilter>();
            }
            gameObject.GetComponent<MeshFilter>().mesh = mesh;
            gameObject.GetComponent<MeshRenderer>().material = mat;
            gameObject.GetComponent<MeshRenderer>().sortingLayerName = "Unit";
            gameObject.GetComponent<MeshRenderer>().sortingOrder = 0;

            Object createObj = PrefabUtility.SaveAsPrefabAsset(gameObject, Path + "/" + texName + "/" + sprite.name + ".prefab");
            GameObject.DestroyImmediate(gameObject);
        }
    }

    void SetPanelVertivesUV(Sprite sprite, out Vector3[] vertices, out Vector2[] uv)
    {
        //vertices = new Vector3[7];
        //uv = new Vector2[7];
        vertices = new Vector3[5];
        uv = new Vector2[5];

        Vector2 pivot = sprite.pivot / 100;
        float width = sprite.rect.width / 100;
        float hight = sprite.rect.height / 100;

        Rect rect = sprite.rect;
        rect.x /= sprite.texture.width;
        rect.y /= sprite.texture.height;
        rect.width /= sprite.texture.width;
        rect.height /= sprite.texture.height;

        for (int i = 0; i < 2; i++)
        {
            for (int j = 0; j < 2; j++)
            {
                vertices[i * 2 + j] = new Vector3(i * width - pivot.x, j * hight - pivot.y, 0);
                uv[i * 2 + j] = new Vector2(rect.x + i * rect.width, rect.y + j * rect.height);
            }
        }

        if (pivot.y <= hight / 2)
        {
            vertices[4] = new Vector3(-pivot.x, pivot.y - hight, 0);
        }
        else
        {
            vertices[4] = new Vector3(-pivot.x, pivot.y, 0);
        }
        uv[4] = new Vector2(rect.x, rect.y);
        //vertices[4] = new Vector3(-pivot.x, pivot.y - hight, 0);
        //vertices[5] = new Vector3(width - pivot.x, pivot.y - hight, 0);
        //vertices[6] = new Vector3(width - pivot.x, -pivot.y, 0);
        //uv[4] = new Vector2(rect.x, rect.y);
        //uv[5] = new Vector2(rect.x, rect.y);
        //uv[6] = new Vector2(rect.x, rect.y);
    }

    int[] SettPanelTriangles()
    {
        //int[] triangles = new int[12];
        int[] triangles = new int[9];

        triangles[0] = 0;
        triangles[1] = 1;
        triangles[2] = 3;
        triangles[3] = 3;
        triangles[4] = 2;
        triangles[5] = 0;
        triangles[6] = 0;
        triangles[7] = 4;
        triangles[8] = 0;

        //triangles[6] = 0;
        //triangles[7] = 6;
        //triangles[8] = 4;
        //triangles[9] = 4;
        //triangles[10] = 6;
        //triangles[11] = 5;
        return triangles;
    }
}