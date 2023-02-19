import { Column, Entity, Index, OneToMany } from "typeorm";
import { SocialPosts } from "./SocialPosts";
import { SocialRosters } from "./SocialRosters";

@Index("social_groups_pkey", ["id"], { unique: true })
@Entity("social_groups", { schema: "public" })
export class SocialGroups {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("text", { name: "name" })
  name: string;

  @Column("text", { name: "introduce", nullable: true })
  introduce: string | null;

  @Column("bigint", { name: "created_by", nullable: true })
  createdBy: string | null;

  @Column("smallint", { name: "status", default: () => "10" })
  status: number;

  @Column("text", { name: "avatar_uri", nullable: true })
  avatarUri: string | null;

  @Column("text", { name: "cover_image_uri", nullable: true })
  coverImageUri: string | null;

  @Column("text", { name: "founder", nullable: true })
  founder: string | null;

  @Column("date", { name: "founding_date", nullable: true })
  foundingDate: string | null;

  @Column("smallint", { name: "type" })
  type: number;

  @Column("character varying", { name: "code", nullable: true })
  code: string | null;

  @Column("integer", { name: "total_member", nullable: true })
  totalMember: number | null;

  @OneToMany(() => SocialPosts, (socialPosts) => socialPosts.group)
  socialPosts: SocialPosts[];

  @OneToMany(() => SocialRosters, (socialRosters) => socialRosters.group)
  socialRosters: SocialRosters[];
}
