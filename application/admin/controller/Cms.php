<?php
namespace app\admin\controller;

use think\Session;
use think\Request;
use think\Loader;

use app\admin\model\CmsCategory;
use app\admin\model\CmsTag;
use app\admin\model\CmsArticle;
use app\admin\model\LogAdminOperation;
use app\admin\model\CmsArticleCount;

use app\admin\controller\Base;

class Cms extends Base{
    public function index(){
        return $this->redirect('Cms/article');
    }

    /**
     * 文章分类列表
     *
     * @return void
     */
    public function cms_category(){
        $list = CmsCategory::order('category_id desc')->paginate($this->page_number, false,['query'=>request()->param()]);
        $this->assign('list', $list);
        return $this->fetch('Cms/cms_category');
    }

    /**
     * 文章分类添加
     *
     * @return void
     */
    public function cms_category_add_submit(){
        $category_name = Request::instance()->param('category_name', '');
        $validate = Loader::validate('CmsCategory');
        if(!$validate->scene('add_name')->check(['category_name'=> $category_name])){
            return json_data(2, '', $validate->getError());
        }
        $res = CmsCategory::create_data($category_name);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一条文章分类，名称为' . $category_name);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 文章分类修改
     *
     * @return void
     */
    public function cms_category_update_submit(){
        $category_id = Request::instance()->param('category_id', 0);
        $category_name = Request::instance()->param('category_name', '');
        $validate = Loader::validate('CmsCategory');
        if(!$validate->scene('update_name')->check(['category_id'=>$category_id, 'category_name'=> $category_name])){
            return json_data(2, '', $validate->getError());
        }
        $res = CmsCategory::update_data(['category_id'=> $category_id], ['category_name'=> $category_name]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了id为'. $category_id .'的文章分类名称，新名称为' . $category_name);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 文章分类删除提交
     *
     * @return void
     */
    public function cms_category_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $model = CmsCategory::get($id);
        if(!$model){
            return json_data(2, '', '系统错误！');
        }
        $res = CmsCategory::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了一条文章分类，名称为' . $model->category_name);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }
    
    /**
     * 文章标签列表
     *
     * @return void
     */
    public function cms_tag(){
        $list = CmsTag::order('tag_id desc')->paginate($this->page_number, false,['query'=>request()->param()]);
        $this->assign('list', $list);
        return $this->fetch('Cms/cms_tag');
    }

    /**
     * 文章标签添加提交
     *
     * @return void
     */
    public function tag_add_submit(){
        $tag_name = Request::instance()->param('tag_name', '');
        $validate = Loader::validate('CmsTag');
        if(!$validate->scene('add')->check(['tag_name'=> $tag_name])){
            return json_data(2, '', $validate->getError());
        }
        $model = new CmsTag(['tag_name'=> $tag_name]);
        $res = $model->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一条文章标签，名称为' . $tag_name);
            return json_data(1, '', '添加成功！');
        }else{
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 文章标签修改提交
     *
     * @return void
     */
    public function tag_update_submit(){
        $data = Request::instance()->param();
        $validate = Loader::validate('CmsTag');
        if(!$validate->scene('update')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $model = new CmsTag();
        $res = $model->allowField(true)->save($data, ['tag_id'=> $data['tag_id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了一条文章标签，名称为' . $data['tag_name']);
            return json_data(1, '', '修改成功！');
        }else{
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 文章标签删除提交
     *
     * @return void
     */
    public function tag_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $model = CmsTag::get($id);
        if(!$model){
            return json_data(2, '', '系统错误！');
        }
        $res = CmsTag::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了一条文章标签，名称为' . $model->tag_name);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }
    
    /**
     * 文章列表
     *
     * @return void
     */
    public function article(){
        $category_id = Request::instance()->param('category_id', 0);
        $title = Request::instance()->param('title', '');
        $author = Request::instance()->param('author', '');
        $status = Request::instance()->param('status', 0);
        $start_time = Request::instance()->param('start_time', '');
        $end_time = Request::instance()->param('end_time', '');
        $article = new CmsArticle();
        $article = ($category_id != 0) ? $article->where('category_id', $category_id) : $article;
        $article = ($title != '') ? $article->where('title', $title) : $article;
        $article = ($author != '') ? $article->where('author', $author) : $article;
        $article = ($status != 0) ? $article->where('status', $status) : $article;
        $article = self::where_time($article, $start_time, $end_time);
        $field = 'article_id,category_id,tag_id,title,author,keyword,image,status,insert_time,is_stick,is_recommend';
        $list = $article->field($field)->order('article_id desc')->paginate($this->page_number, false,['query'=>request()->param()]);
        foreach($list as &$v){
            $v['tag_ids'] = $v->tag_id != '' ? CmsTag::where('tag_id', 'in', $v->tag_id)->select() : [];
        }
        self::many_assign(['list'=> $list, 'title'=> $title, 'category_id'=> $category_id, 'author'=> $author, 'status'=> $status, 'start_time'=> $start_time, 'end_time'=> $end_time]);
        return $this->fetch('Cms/article');
    }

    /**
     * 文章添加
     *
     * @return void
     */
    public function article_add(){
        $category = CmsCategory::order('category_id desc')->select();
        $tag = CmsTag::order('tag_id desc')->select();
        self::many_assign(['category'=> $category, 'tag'=> $tag]);
        return $this->fetch('Cms/article_add');
    }

    /**
     * 文章添加提交
     *
     * @return void
     */
    public function article_add_submit(){
        $data = Request::instance()->param();
        $image = Request::instance()->file('image', '');
        if($image){
            $image_res = file_upload($image, 'article');
            if($image_res == 2){
                return json_data(2, '', $image_res['error']);
            }
            $data['image'] = $image_res['file_path'];
        }else{
            unset($data['image']);
        }
        $validate = Loader::validate('CmsArticle');
        if(!$validate->scene('add')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $data['author'] = isset($data['author']) ? $data['author'] : Session::get('admin')->nickname;
        $data['insert_time'] = date('Y-m-d H:i:s', time());
        $model = new CmsArticle($data);
        $res = $model->allowField(true)->save();
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '添加了一条文章，标题为' . $data['title']);
            CmsArticleCount::create_data($model->article_id);
            return json_data(1, '', '添加成功！');
        }else{
            $image ? delete_image($data['image']) : '';
            return json_data(2, '', '添加失败！');
        }
    }

    /**
     * 文章修改
     *
     * @return void
     */
    public function article_update(){
        $article_id = Request::instance()->param('id', 0);
        $detail = CmsArticle::get($article_id);
        $category = CmsCategory::order('category_id desc')->select();
        $tag = CmsTag::order('tag_id desc')->select();
        foreach($tag as &$v){
            $v['has_tag'] = 1;
            if($v->tag_id != ''){
                if(strpos($detail->tag_id, $v->tag_id.',') === false){
                    $v['has_tag'] = 0;
                }
            }
        }
        self::many_assign(['category'=> $category, 'tag'=> $tag, 'detail'=> $detail]);
        return $this->fetch('Cms/article_update');
    }

    /**
     * 文章修改提交
     *
     * @return void
     */
    public function article_update_submit(){
        $data = Request::instance()->param();
        $image = Request::instance()->file('image', '');
        $old_image = '';
        if($image){
            $image_res = file_upload($image, 'article');
            if($image_res == 2){
                return json_data(2, '', $image_res['error']);
            }
            $data['image'] = $image_res['file_path'];
            $old_image = CmsArticle::where("article_id", $data['article_id'])->value('image');
        }else{
            unset($data['image']);
        }
        $validate = Loader::validate('CmsArticle');
        if(!$validate->scene('update')->check($data)){
            return json_data(2, '', $validate->getError());
        }
        $model = new CmsArticle();
        $res = $model->allowField(true)->save($data, ['article_id'=> $data['article_id']]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '修改了文章:' . $data['title']);
            $image ? delete_image($old_image) : ''; //删除旧图片
            return json_data(1, '', '修改成功！');
        }else{
            $image ? delete_image($data['image']) : ''; //删除刚刚上传的图片
            return json_data(2, '', '修改失败！');
        }
    }

    /**
     * 文章删除提交
     *
     * @return void
     */
    public function article_delete_submit(){
        $id = Request::instance()->param('id', 0);
        $model = CmsArticle::get($id);
        if(!$model){
            return json_data(2, '', '系统错误！');
        }
        $res = CmsArticle::destroy($id);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '删除了一条文章，标题为' . $model->title);
            delete_image($model->image);
            return json_data(1, '', '删除成功！');
        }else{
            return json_data(2, '', '删除失败！');
        }
    }

    /**
     * 推荐设置
     *
     * @return void
     */
    public function recommend(){
        $id = Request::instance()->param('id', 0);
        $status = Request::instance()->param('status', 0);
        if($status == 1){
            $status_text = '设为推荐';
        }else{
            $status_text = '取消推荐';
        }
        $model = new CmsArticle();
        $res = $model->allowField(true)->save(['is_recommend'=>$status], ['article_id'=> $id]);
        if($res){
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '文章' . $id . $status_text);
            return json_data(1, '', $status_text . '成功！');
        }else{
            return json_data(2, '', $status_text . '失败！');
        }
    }

    /**
     * 置顶设置
     *
     * @return void
     */
    public function stick(){
        $id = Request::instance()->param('id', 0);
        $status = Request::instance()->param('status', 0);
        $old_article_id = 0;
        $old_stick = null;
        if($status == 1){
            $status_text = '设为置顶';
            $old_stick = CmsArticle::field('article_id, is_stick')->where('is_stick', 1)->find();
        }else{
            $status_text = '取消置顶';
            
        }
        $model = new CmsArticle();
        $res = $model->allowField(true)->save(['is_stick'=>$status], ['article_id'=> $id]);
        if($res){
            if($old_stick){
                $old_stick->is_stick = 0;
                $old_stick->save();
                LogAdminOperation::create_data(Session::get('admin')->admin_id, '文章' . $old_stick->article_id . '取消置顶');
                $old_article_id = $old_stick->article_id;
            }
            LogAdminOperation::create_data(Session::get('admin')->admin_id, '文章' . $id . $status_text);
            return json_data(1, $old_article_id, $status_text . '成功！');
        }else{
            return json_data(2, '', $status_text . '失败！');
        }
    }
}
